package com.starshop.controllers.buyer;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.entities.Order;
import com.starshop.entities.Product;
import com.starshop.entities.ProductReview;
import com.starshop.services.BuyerService;
import com.starshop.services.JwtService;
import com.starshop.services.ProductReviewService;
import com.starshop.services.ProductService;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/buyer/reviews")
public class ProductReviewController {
	@Autowired
	JwtService jwtService;
	@Autowired
	BuyerService buyerService;
	@Autowired
	ProductReviewService reviewService;
	@Autowired
	ProductService productService;

	@GetMapping("test")
	public String index() {
		return "test";
	}


	@PostMapping("/deleteReview")
	public String deleteReview(@RequestParam int reviewId, HttpServletRequest request) {
	    String jwtToken = null;
	    ProductReview review = reviewService.findById(reviewId).orElseThrow(() -> new RuntimeException("Review Not Found"));
	    if (request.getCookies() != null) {
	        for (Cookie cookie : request.getCookies()) {
	            if ("jwtToken".equals(cookie.getName())) {
	                jwtToken = cookie.getValue();
	            }
	        }
	    }

	    if (jwtToken != null) {
	        Claims claims = jwtService.extractAllClaims(jwtToken);
	        String currentUserEmail = claims.getSubject();
	        
	        // Kiểm tra xem bình luận có thể xóa không
	        
	        if (review.getBuyer().getEmail().equals(currentUserEmail)) {
	            reviewService.deleteById(reviewId);
	        }
	    }

	    return "redirect:/buyer/products/productDetail?productId=" + review.getProduct().getId();
	}

	
	
	
//	@PostMapping("/postReview")
//	public String saveOrUpdateReview(Model model,HttpServletRequest request, @RequestParam("buyerId") int buyerId,
//			@RequestParam("productId") Long productId, @RequestParam("reviewContent") String reviewContent, @RequestParam int rating) {
//		String jwtToken = null;
//
//		if (request.getCookies() != null) {
//			for (Cookie cookie : request.getCookies()) {
//				if ("jwtToken".equals(cookie.getName())) {
//					jwtToken = cookie.getValue();
//				}
//			}
//		}
//
//		if (jwtToken != null) {
//			// Giải mã JWT để lấy thông tin người dùng
//			Claims claims = jwtService.extractAllClaims(jwtToken);
//			String email = claims.getSubject(); // Giá trị `sub` trong JWT payload
//
//			// Lấy Buyer dựa trên email hoặc thông tin khác
//			Buyer currentBuyer = buyerService.findBuyerByEmail(email);
//
//			
//			Product product = productService.findById(productId).orElseThrow(()->new RuntimeException("Buyer Not Found"));
//			ProductReview productReview = new ProductReview();
//			productReview.setReviewContent(reviewContent);
//			productReview.setReviewDate(new Date());
//			productReview.setBuyer(currentBuyer);
//			productReview.setProduct(product);
//			reivewService.save(productReview);
//		}
//		
//		return "redirect:/buyer/products/productDetail?productId=" + productId.toString();
//	}
	@PostMapping("/postReview")
	@ResponseBody
	public ResponseEntity<?> saveOrUpdateReview(@RequestBody Map<String, Object> payload,HttpServletRequest request) {
	    try {
	    	String jwtToken= null;
	    	if (request.getCookies() != null) {
				for (Cookie cookie : request.getCookies()) {
					if ("jwtToken".equals(cookie.getName())) {
						jwtToken = cookie.getValue();
					}
				}
			}
	    	
	    	String email  ;
	        Buyer currentBuyer=null;
	        
			if (jwtToken != null) {
				// Giải mã JWT để lấy thông tin người dùng
				Claims claims = jwtService.extractAllClaims(jwtToken);
				email = claims.getSubject(); // Giá trị `sub` trong JWT payload

				// Lấy Buyer dựa trên email hoặc thông tin khác
				currentBuyer = buyerService.findBuyerByEmail(email);
			}
	        
	        
			Long productID = Long.parseLong(payload.get("productID").toString());
	        int rating = Integer.parseInt(payload.get("rating").toString());
	        String reviewContent = (String) payload.get("reviewContent");
	        
	        
	        Product product = productService.findById(productID)
	                .orElseThrow(() -> new RuntimeException("Product not found"));
	        
	        
	        
	        ProductReview productReview = new ProductReview();
	        productReview.setReviewContent(reviewContent);
	        productReview.setReviewDate(new Date());
	        productReview.setRating(rating);
	        productReview.setBuyer(currentBuyer);
	        productReview.setProduct(product);
	        reviewService.save(productReview);
	        
	        return ResponseEntity.ok(Map.of("success", true));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "error", e.getMessage()));
	    }
	}

}
