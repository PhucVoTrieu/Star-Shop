package com.starshop.controllers.buyer;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cloudinary.Cloudinary;
import com.starshop.entities.Buyer;
import com.starshop.entities.Category;
import com.starshop.entities.Product;
import com.starshop.entities.ProductReview;
import com.starshop.services.BuyerService;
import com.starshop.services.CategoryService;
import com.starshop.services.JwtService;
import com.starshop.services.OrderService;
import com.starshop.services.ProductReviewService;
import com.starshop.services.ProductService;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/buyer/products")
public class BuyerProductController {

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
	public String allProducts(ModelMap model, Pageable pageable) {
		 int size = pageable.getPageSize() > 0 ? pageable.getPageSize() : 10; // Mặc định size = 10
		    int page = pageable.getPageNumber() >= 0 ? pageable.getPageNumber() : 0; // Đảm bảo page không âm

		    
		    
		Page<Product> productPage = productService
				.findAll(PageRequest.of(page, 9));
		addPaginationAttributes(model, pageable, productPage);
		setProductImageUrls(productPage);
		model.addAttribute("productPage", productPage);

		Pageable latestProductpageable = PageRequest.of(0, 3); // Lấy 3 sản phẩm đầu tiên
		List<Product> latestProducts = productService.findTopByOrderByCreatedDateDesc(latestProductpageable);
		model.addAttribute("latestProducts", latestProducts);
		
		
		
		return "buyer/product-list"; // Trang hiển thị danh sách sản phẩm
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