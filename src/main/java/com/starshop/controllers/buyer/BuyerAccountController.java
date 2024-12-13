package com.starshop.controllers.buyer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nimbusds.oauth2.sdk.http.HTTPRequest;
import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.entities.Product;
import com.starshop.services.AddressService;
import com.starshop.services.BuyerService;
import com.starshop.services.JwtService;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/buyer/account")
public class BuyerAccountController {
	@Autowired
	JwtService jwtService;
	@Autowired
	BuyerService buyerService;
	@Autowired
	AddressService addressService;
	
	@RequestMapping("")
	public String index(HttpServletRequest request, Model model) {
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
		 
			

		return "buyer/myAccount"; // Trang hiển thị danh sách sản phẩm
	}

}
