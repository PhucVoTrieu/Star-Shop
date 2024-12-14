package com.starshop.controllers.buyer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.entities.CartItem;
import com.starshop.entities.ShoppingCart;
import com.starshop.services.AddressService;
import com.starshop.services.BuyerService;
import com.starshop.services.CartService;
import com.starshop.services.JwtService;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/buyer/checkout")
public class BuyerCheckoutController {
	@Autowired
	JwtService jwtService;
	@Autowired
	BuyerService buyerService;
	@Autowired
	AddressService addressService;
	@Autowired
	CartService cartService;
	
	@RequestMapping("{cartID}")
	public String index(HttpServletRequest request, Model model, @PathVariable Long cartID) {
		String jwtToken = null;
		 
		if (request.getCookies() != null) {
	        for (Cookie cookie : request.getCookies()) {
	            if ("jwtToken".equals(cookie.getName())) {
	            	jwtToken =  cookie.getValue();
	            }
	        }
	    }
		
		if (jwtToken != null) {
		        // Giải mã JWT để lấy thông tin người dùng
		        Claims claims = jwtService.extractAllClaims(jwtToken);
		        String email = claims.getSubject(); // Giá trị `sub` trong JWT payload
		        String scope = claims.get("scope", String.class); // Giá trị `scope` trong payload

		 
				// Lấy Buyer dựa trên email hoặc thông tin khác
		        Buyer currentBuyer = buyerService.findBuyerByEmail(email);
		        
		        List<Address> shippingAddress = currentBuyer.getAddresses();
		        
		        model.addAttribute("shippingAddress", shippingAddress);
		        model.addAttribute("addressQuantity", shippingAddress.size());
		        // Gắn thông tin người dùng vào model
		        model.addAttribute("buyerID", currentBuyer.getId());
		   } 
		 	ShoppingCart cart = cartService.findByCartId(cartID).orElseThrow(()->new RuntimeException("Cart Not Found"));
		 	model.addAttribute("cartID",cartID);
			List<CartItem> cartItemList = cart.getCartItems();
			model.addAttribute("cartItemList",cartItemList);
		return "buyer/checkout"; // Trang hiển thị danh sách sản phẩm
	}
	
	

}
