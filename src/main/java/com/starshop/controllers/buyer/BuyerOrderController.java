package com.starshop.controllers.buyer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.starshop.entities.Buyer;
import com.starshop.entities.Order;
import com.starshop.entities.CartItem;
import com.starshop.entities.OrderItem;
import com.starshop.entities.Product;
import com.starshop.entities.ShoppingCart;
import com.starshop.services.BuyerService;
import com.starshop.services.CartService;
import com.starshop.services.OrderService;
import com.starshop.services.ProductService;

import jakarta.servlet.http.HttpServletRequest;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/buyer/orders")  // Thêm prefix /buyer để phân biệt với admin
public class BuyerOrderController {
    @Autowired
	BuyerService buyerService;
    
    @Autowired
	OrderService orderService;
    @Autowired
   	CartService cartService;
	@PostMapping("placeOrder")
	public String index(HttpServletRequest request, Model model, @RequestParam Long cartID, @RequestParam int buyerID , @RequestParam double totalPrice ){
		 try {
	            // Chuyển đổi JSON thành List
//	            ObjectMapper objectMapper = new ObjectMapper();
//	            List<CartItem> cartItemList = objectMapper.readValue(orderItemListJson, new TypeReference<List<CartItem>>() {});
//	            
//	          
//	            
//	            
//	            
//	            for (CartItem cartItem : cartItemList) {
//	                OrderItem orderItem = new OrderItem();
//
//	                // Gán giá trị từ CartItem sang OrderItem
//	                orderItem.setCartItem(cartItem); // Liên kết với CartItem
//	                orderItem.setOrder(order); // Gán đối tượng Order liên quan
//	                orderItem.setQuantity(cartItem.getQuantity()); // Gán số lượng
//	                orderItem.setPrice(cartItem.getProduct().getPrice() * cartItem.getQuantity()); // Tính tổng giá
//	                
//	                // Thêm vào danh sách OrderItem
//	                orderItemList.add(orderItem);
//	            }
			
			 	Order order = new Order();
			 ShoppingCart cart = cartService.findByCartId(cartID).orElseThrow(()->new RuntimeException("Cart Not Found"));
		     List<CartItem> cartItemList = cart.getCartItems();
		     
		     
		     List<OrderItem> orderItemList = new ArrayList<>();
		     for (CartItem cartItem : cartItemList) {
	                OrderItem orderItem = new OrderItem();

	                // Gán giá trị từ CartItem sang OrderItem
	                orderItem.setCartItem(cartItem); // Liên kết với CartItem
	                orderItem.setOrder(order); // Gán đối tượng Order liên quan
	                orderItem.setQuantity(cartItem.getQuantity()); // Gán số lượng
	                orderItem.setPrice(cartItem.getProduct().getPrice() * cartItem.getQuantity()); // Tính tổng giá
	                
	                // Thêm vào danh sách OrderItem
	                orderItemList.add(orderItem);
	            }
		     
	            order.setBuyer(buyerService.findById(buyerID).orElseThrow(()->new RuntimeException("Buyer Not Found")));
	            order.setOrderDate(new Date());
	            order.setOrderItems(orderItemList);
	            order.setStatus("Pending");
	            order.setTotalPrice(totalPrice);
	            orderService.save(order);
	            

	            // Trả về view hoặc thực hiện các tác vụ khác
	           
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "error";
	        }
        
            
		 return "redirect:/common/products";
        // Chuyển hướng về trang chủ
        
    }
	
	
    
    // Hiển thị danh sách/lịch sử đơn hàng (gộp 2 phương thức getPurchaseHistory và getMyOrders)
   

	
}