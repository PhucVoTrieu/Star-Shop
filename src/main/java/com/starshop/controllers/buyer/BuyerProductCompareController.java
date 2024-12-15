package com.starshop.controllers.buyer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starshop.entities.Buyer;
import com.starshop.entities.CompareList;
import com.starshop.entities.Product;
import com.starshop.services.BuyerService;
import com.starshop.services.CategoryService;
import com.starshop.services.CompareListService;
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
@RequestMapping("/buyer/product-compare")
public class BuyerProductCompareController {
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
	CompareListService compareService;
	
	
	@GetMapping("/addCompareItem")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addCompareItem(@RequestParam("productID") Long productId, HttpServletRequest request) {
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
	

		Buyer currentBuyer = null;
		if (currentUserEmail != null) {
			currentBuyer = buyerService.findBuyerByEmail(currentUserEmail);
		}
	
	    Map<String, Object> response = new HashMap<>();
	    
	    Product product = productService.findById(productId).orElseThrow(()->new RuntimeException("Buyer Not Found"));
	    
	    Buyer buyer = currentBuyer;
	    
	    if (product!=null) {
	        // Thêm sản phẩm vào danh sách so sánh
	    	// compareService.addProductToCompareList(buyer, productId);
	   
	            // Lấy CompareList của Buyer
	            CompareList compareList = compareService.findByBuyerID(buyer.getId())
	                    .orElse(new CompareList()); // Nếu không có, tạo mới

	            // Kiểm tra các vị trí product1, product2, product3 còn trống không
	            if (compareList.getProduct1ID() == null) {
	                compareList.setProduct1ID(productId) ;
	            } else if (compareList.getProduct2ID() == null) {
	                compareList.setProduct2ID(productId) ;
	            } else if (compareList.getProduct3ID() == null) {
	                compareList.setProduct3ID(productId)  ;
	            } else {
	            	
	                throw new RuntimeException("Compare list is full");
	            }

	            // Lưu hoặc cập nhật CompareList
	            //compareList.set(buyer); // Đảm bảo buyer đã được thiết lập
	            compareService.save(compareList);
	        
	    	
	       // response.put("compareItemCount", compareService.getCompareListCount(buyer)); // Số lượng sản phẩm trong danh sách so sánh
	    } else {
	        response.put("success", false);
	        response.put("message", "Sản phẩm không tồn tại!");
	    }
	    
	    return ResponseEntity.ok(response);
	}

	
	@RequestMapping("/delete")
	public String deleteItem(Model model, HttpServletRequest request, @RequestParam Long productID) {
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

		CompareList compareList = compareService.findByBuyerID(currentBuyer.getId())
				.orElseThrow(() -> new RuntimeException("Buyer Not Found"));
		if (compareList.getProduct1ID() != null && compareList.getProduct1ID().equals(productID)) {
			compareList.setProduct1ID(null);
		}
		if (compareList.getProduct2ID() != null && compareList.getProduct2ID().equals(productID)) {
			compareList.setProduct2ID(null);
		}
		if (compareList.getProduct3ID() != null && compareList.getProduct3ID().equals(productID)) {
			compareList.setProduct3ID(null);
		}
		compareService.save(compareList);
		return "redirect:/buyer/product-compare";
	}

	@RequestMapping("")
	public String showComparePage(Model model, HttpServletRequest request) {
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

		CompareList compareList = compareService.findByBuyerID(currentBuyer.getId())
				.orElseThrow(() -> new RuntimeException("compareList Not Found")); // Lấy compareList từ DB

//		List<Product> products = compareService.getProductsFromCompareList(compareList);
		List<Product> products = new ArrayList<>();
		Product product1 = (compareList.getProduct1ID() != null) ? productService.findById(compareList.getProduct1ID())
				.orElseThrow(() -> new RuntimeException("Product 1 Not Found")) : null;

		Product product2 = (compareList.getProduct2ID() != null) ? productService.findById(compareList.getProduct2ID())
				.orElseThrow(() -> new RuntimeException("Product 2 Not Found")) : null;

		Product product3 = (compareList.getProduct3ID() != null) ? productService.findById(compareList.getProduct3ID())
				.orElseThrow(() -> new RuntimeException("Product 3 Not Found")) : null;
		if(product1!=null)
		products.add(product1);
		if(product2!=null)
		products.add(product2);
		if(product3!=null)
		products.add(product3);
		model.addAttribute("products", products); // Truyền danh sách sản phẩm

		return "buyer/product-compare";
	}
//
//    @PostMapping("/add")
//    public String addProductToCompare(@RequestParam("buyerID") int buyerID, 
//                                      @RequestParam("productID") Long productID) {
//      
//    }

//	@RequestMapping("/addProductToCompare")
//    public String addProductToCompare(@RequestParam("productId") Long productId, HttpSession session) {
//        List<Product> compareProducts = (List<Product>) session.getAttribute("compareProducts");
//        
//        if (compareProducts == null) {
//            compareProducts = new ArrayList<>();
//            session.setAttribute("compareProducts", compareProducts);
//        }
//
//        Product product = productService.getProductById(productId);
//        compareProducts.add(product);
//
//        return "redirect:/compare"; // Redirect to compare page
//    }
//
//    @RequestMapping("/compare")
//    public String showComparePage(Model model, HttpSession session) {
//        List<Product> compareProducts = (List<Product>) session.getAttribute("compareProducts");
//        model.addAttribute("compareProducts", compareProducts);
//        return "compare"; // JSP page to display the compare list
//    }
//
//    @RequestMapping("/deleteProductFromCompare")
//    public String deleteProductFromCompare(@RequestParam("productId") Long productId, HttpSession session) {
//        List<Product> compareProducts = (List<Product>) session.getAttribute("compareProducts");
//        if (compareProducts != null) {
//            compareProducts.removeIf(p -> p.getId().equals(productId));
//        }
//        return "redirect:/compare"; // Redirect to compare page after deletion
//    }
}
