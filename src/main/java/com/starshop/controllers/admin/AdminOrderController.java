package com.starshop.controllers.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloudinary.Cloudinary;
import com.starshop.entities.Order;
import com.starshop.entities.Product;
import com.starshop.services.BuyerService;
import com.starshop.services.CategoryService;
import com.starshop.services.FlowerColorService;
import com.starshop.services.FlowerRecipientService;
import com.starshop.services.JwtService;
import com.starshop.services.OrderService;
import com.starshop.services.ProductReviewService;
import com.starshop.services.ProductService;

@Controller
@RequestMapping("/admin/orders")
public class AdminOrderController {
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

	@RequestMapping("")
	public String allOrders(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size,
			ModelMap model) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Order> orderPage = orderService.findAll(pageable);

		// Gán thuộc tính phân trang
		model.addAttribute("orderPage", orderPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", size);
		model.addAttribute("totalPages", orderPage.getTotalPages());
		model.addAttribute("totalItems", orderPage.getTotalElements());
		return "admin/order-management";
	}

	
	@PostMapping("/updateStatus")
	public String updateOrderStatus(@RequestParam Long orderID, @RequestParam String newStatus) {
		
			
			
			// Gọi service để cập nhật trạng thái
			orderService.updateStatus(orderID, newStatus);

			
		
		return "redirect:/admin/orders";
	}
}
