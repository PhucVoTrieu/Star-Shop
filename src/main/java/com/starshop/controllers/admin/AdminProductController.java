package com.starshop.controllers.admin;

import java.util.List;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.starshop.entities.Buyer;
import com.starshop.entities.Category;
import com.starshop.entities.FlowerColor;
import com.starshop.entities.FlowerRecipient;
import com.starshop.entities.Product;
import com.starshop.entities.ProductReview;
import com.starshop.services.BuyerService;
import com.starshop.services.CategoryService;
import com.starshop.services.FlowerColorService;
import com.starshop.services.FlowerRecipientService;
import com.starshop.services.JwtService;
import com.starshop.services.OrderService;
import com.starshop.services.ProductReviewService;
import com.starshop.services.ProductService;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/products")
public class AdminProductController {
	@Autowired
	private FlowerColorService flowerColorService;
	@Autowired
	private FlowerRecipientService flowerRecipientService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BuyerService buyerService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductReviewService productReviewService;
	@Autowired
	JwtService jwtService;
	@Autowired
	private Cloudinary cloudinary;

	private String message;

	// Lấy tất cả sản phẩm với phân trang
	@RequestMapping("")
	public String allProducts(
	    @RequestParam(defaultValue = "0") int page,
	    @RequestParam(defaultValue = "10") int size,
	    ModelMap model
	) {
	    Pageable pageable = PageRequest.of(page, size);
	    Page<Product> productPage = productService.findAll(pageable);

	    // Gán thuộc tính phân trang
	    model.addAttribute("productPage", productPage);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("pageSize", size);

	    return "admin/product-management";
	}
	@RequestMapping("/add-product")
	public String addProduct(Model model) {
		 	List<Category> categories = categoryService.findAll();
		    List<FlowerColor> colors = flowerColorService.findAll();
		    List<FlowerRecipient> recipients = flowerRecipientService.findAll();

		    // Đưa danh sách vào model
		    model.addAttribute("categories", categories);
		    model.addAttribute("colors", colors);
		    model.addAttribute("recipients", recipients);

		    return "admin/product-add"; // Trả về tên view JSP
	}
	@PostMapping("/create-product")
    public String createProduct(@RequestParam("name") String name,
                                 @RequestParam("category") Long categoryId,
                                 @RequestParam("color") Long colorId,
                                 @RequestParam("recipient") Long recipientId,
                                 @RequestParam("price") Double price,
                                 @RequestParam("description") String description,
                                 @RequestParam("imageURL") String imageURL,
                                 RedirectAttributes redirectAttributes) {

        try {
            // Tạo đối tượng Product mới
            Product product = new Product();
            product.setName(name);
            product.setCategory(categoryService.findById(categoryId).orElseThrow(()->new RuntimeException("categoryId Not Found")));
            product.setColor(flowerColorService.findById(colorId).orElseThrow(()->new RuntimeException("flowerColorService Not Found")));
            product.setRecipient(flowerRecipientService.findById(recipientId).orElseThrow(()->new RuntimeException("Recipient Not Found")));
            product.setPrice(price);
            product.setDescription(description);
            product.setImageUrl(imageURL);
            product.setCreatedDate(LocalDateTime.now());
            // Lưu sản phẩm vào cơ sở dữ liệu
            productService.save(product);

            // Thông báo thành công
            redirectAttributes.addFlashAttribute("successMessage", "Product added successfully!");
        } catch (Exception e) {
            // Xử lý lỗi và thông báo thất bại
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to add product: " + e.getMessage());
        }

        return "redirect:/admin/products/add-product"; // Chuyển hướng về danh sách sản phẩm
    }

	@RequestMapping("/delete-product/{id}")
	 public String deleteProduct(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            productService.deleteById(id);
            redirectAttributes.addFlashAttribute("message", "Product deleted successfully!");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", "Failed to delete product: " + e.getMessage());
        }
        return "redirect:/admin/products"; // Redirect lại danh sách sản phẩm sau khi xóa
    }
	@RequestMapping("/edit-product/{id}")
	 public String editProduct(@PathVariable("id") Long id, Model model) {
       Product product = productService.findById(id).orElseThrow(()->new RuntimeException("Product Not Found"));
       
       model.addAttribute("categories", categoryService.findAll());
       model.addAttribute("colors", flowerColorService.findAll());
       model.addAttribute("recipients", flowerRecipientService.findAll());
       model.addAttribute(product);
       return "admin/product-edit"; // Redirect lại danh sách sản phẩm sau khi xóa
   }
	@RequestMapping(value = "/update-product", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute Product product) {
	    productService.save(productService.findById(product.getId()).orElseThrow(()->new RuntimeException("Product Not Found")));
	    return "redirect:/admin/products";
	}

	@RequestMapping("productDetail")
	public String productDetail(ModelMap model, Pageable pageable, @RequestParam Long productId,
			HttpServletRequest request) {
		String jwtToken = null;
		if (request.getCookies() != null) {
			for (Cookie cookie : request.getCookies()) {
				if ("jwtToken".equals(cookie.getName())) {
					jwtToken = cookie.getValue();
				}
			}
		}

		String currentUserEmail = null;
		if (jwtToken != null) {
			Claims claims = jwtService.extractAllClaims(jwtToken);
			currentUserEmail = claims.getSubject();
		}
		model.addAttribute("currentUserEmail", currentUserEmail);

		Buyer currentBuyer = null;
		if (currentUserEmail != null) {
			currentBuyer = buyerService.findBuyerByEmail(currentUserEmail);
		}

		boolean hasPurchased = false;
		if (currentBuyer != null) {
			hasPurchased = orderService.hasBuyerPurchasedProduct(currentBuyer, productId);
		}
		model.addAttribute("hasPurchased", hasPurchased);

		Product product = productService.findById(productId)
				.orElseThrow(() -> new RuntimeException("Product Not Found"));
		List<ProductReview> list = product.getReviews();
		model.addAttribute("reviewList", list);
		model.addAttribute("product", product);
		
		boolean hasReviewed = productReviewService.existsByBuyerIdAndProductId(currentBuyer.getId(),productId );
        model.addAttribute("hasReviewed",hasReviewed);
		
		double averageRating = list.stream().mapToInt(ProductReview::getRating) // Lấy giá trị rating
				.average() // Tính trung bình
				.orElse(0.0); // Nếu không có review nào, trả về 0
		model.addAttribute("averageRating", averageRating);
		return "buyer/product-detail"; // Trang hiển thị danh sách sản phẩm
	}

	

	// phân trang
	private void addPaginationAttributes(ModelMap model, Pageable pageable, Page<Product> productPage) {
		int currentPage = pageable.getPageNumber();
		int totalPages = productPage.getTotalPages();
		if (totalPages > 0) {
			int start = Math.max(1, currentPage - 2);
			int end = Math.min(currentPage + 2, totalPages);
			List<Integer> pageNumbers = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);
		}
	}

	// Lấy URL tạo ra từ Cloudinary
	private void setProductImageUrls(Page<Product> productPage) {
		productPage.forEach(product -> {
			String imageUrl = cloudinary.url().publicId(product.getImageUrl()).generate();
			product.setImageUrl(imageUrl);
		});
	}
}