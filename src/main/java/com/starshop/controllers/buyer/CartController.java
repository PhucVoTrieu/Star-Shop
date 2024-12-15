package com.starshop.controllers.buyer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.starshop.DTO.CartItemDTO;
import com.starshop.entities.Buyer;
import com.starshop.entities.CartItem;
import com.starshop.entities.Product;
import com.starshop.entities.ShoppingCart;
import com.starshop.services.BuyerService;
import com.starshop.services.CartService;
import com.starshop.services.ProductService;
import com.starshop.services.impl.CartServiceImpl;
import com.starshop.services.impl.ProductServiceImpl;

import jakarta.servlet.http.HttpServletRequest;

@RequestMapping("/buyer/cart")
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BuyerService buyerService;
	@GetMapping("")
	public String viewCart(Model model, @RequestParam(name = "cartID", required = false) Long cartid, HttpServletRequest request) {
		if (cartid == null) {
			// Xử lý trường hợp cartID không có trong request
			throw new RuntimeException("cartID is required");
		}
		Buyer buyer = buyerService.findById(1).orElseThrow(() -> new RuntimeException("Buyer not found"));
		request.getSession().setAttribute("buyer", buyer);
		
		ShoppingCart cart = cartService.findByCartId(cartid).orElseThrow(() -> new RuntimeException("cart not found"));
		model.addAttribute("cartID", cartid); // Truyền cartID vào model
		List<CartItem> cartItems = cart.getCartItems();
		if(cartItems.size()==0) {
			return "buyer/empty-cart";
		}
		model.addAttribute("listCartItem", cartItems);
		return "buyer/cart";
	}

	@PostMapping("/updateQuantity")
	public ResponseEntity<?> updateQuantity(@RequestBody Map<String, Object> request) {
	    Long cartItemId = Long.valueOf(request.get("cartItemId").toString());
	    int quantity = Integer.parseInt(request.get("quantity").toString());

	    try {
	        cartService.updateQuantity(cartItemId, quantity);
	        return ResponseEntity.ok(Map.of("success", true, "message", "Quantity updated successfully!"));
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
	            Map.of("success", false, "message", e.getMessage())
	        );
	    }
	}


//	@ModelAttribute("cartTotalValue")
//	public double calculateCartTotalValue(@ModelAttribute("cartItemsForCartIcon") List<CartItem> cartItems) {
//		return cartItems.stream().mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity()).sum();
//	}

	@GetMapping("/deleteCartItem")
	public String deleteCartItem(Model model, @RequestParam("cartItemID") Long cartItemId,
			RedirectAttributes redirectAttributes) {
		CartItem cartItem = cartService.findById(cartItemId)
				.orElseThrow(() -> new RuntimeException("cartItem not found"));

		cartService.delete(cartItem);

		redirectAttributes.addFlashAttribute("message", "Xóa vật phẩm thành công!");

		ShoppingCart cart = cartItem.getShoppingCart();
		// Redirect đến URL /buyer/cart
		return "redirect:/buyer/cart?cartID=" + cart.getCartId();
	}
	@GetMapping("/deleteAllCartItems")
	public String deleteAllCartItem(Model model, @RequestParam("cartID") Long cartId,
			RedirectAttributes redirectAttributes) {
		ShoppingCart cart = cartService.findByCartId(cartId)
				.orElseThrow(() -> new RuntimeException("ShoppingCart not found"));
		
		cartService.deleteByShoppingCart(cart);
		

		redirectAttributes.addFlashAttribute("message", "Xóa vật phẩm thành công!");

	
		return "redirect:/buyer/cart?cartID=" + cartId;
	}
//	@GetMapping("/addCartItem")
//	public String addCartItem(@RequestParam("productID") Long productId, Model model,RedirectAttributes redirectAttributes) {
//		// Tìm sản phẩm dựa trên ID
//		Optional<Product> product = productService.findById(productId);
//		Buyer buyer = buyerService.findById(1L).orElseThrow(() -> new RuntimeException("Buyer not found"));
//		if (product != null) {
//			
//			// Thêm sản phẩm vào giỏ hàng
//			cartService.addCartItem(buyer, productId, 1);
//			redirectAttributes.addFlashAttribute("successMessage", "Thêm vật phẩm thành công!");
//		} else {
//			// model.addAttribute("error", "Product not found!");
//			  redirectAttributes.addFlashAttribute("errorMessage", "Sản phẩm không tìm thấy!");
//		}
//
//		//return "redirect:/buyer/cart?cartID="+ buyer.getShoppingCart().getCartId();
//		return "redirect:/buyer/products";
//	}
	@GetMapping("/addCartItem")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addCartItem(@RequestParam("productID") Long productId) {
	    Map<String, Object> response = new HashMap<>();
	    Optional<Product> product = productService.findById(productId);
	    Buyer buyer = buyerService.findById(1).orElseThrow(() -> new RuntimeException("Buyer not found"));
	    
	    if (product.isPresent()) {
	        // Thêm sản phẩm vào giỏ hàng
	        cartService.addCartItem(buyer, productId, 1);

	        response.put("cartItemCount", buyer.getShoppingCart().getCartItems().size()); // Số lượng item trong giỏ hàng
	    } else {
	        response.put("success", false);
	        response.put("message", "Sản phẩm không tồn tại!");
	    }
	    
	    return ResponseEntity.ok(response);
	}
	
	@GetMapping("/addMultiCartItem")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addMultiCartItem(@RequestParam("productID") Long productId, @RequestParam("productQuantity") int quantity) {
	    Map<String, Object> response = new HashMap<>();
	    Optional<Product> product = productService.findById(productId);
	    Buyer buyer = buyerService.findById(1).orElseThrow(() -> new RuntimeException("Buyer not found"));

	    if (product.isPresent()) {
	        // Thêm sản phẩm vào giỏ hàng
	        cartService.addCartItem(buyer, productId, quantity);

	        response.put("cartItemCount", buyer.getShoppingCart().getCartItems().size()); // Số lượng item trong giỏ hàng
	    } else {
	        response.put("success", false);
	        response.put("message", "Sản phẩm không tồn tại!");
	    }
	    
	    return ResponseEntity.ok(response);
	}

}
