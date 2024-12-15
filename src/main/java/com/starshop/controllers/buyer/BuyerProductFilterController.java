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
@RequestMapping("/filter")
public class BuyerProductFilterController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private FlowerColorService flowerColorService;

	@Autowired
	private FlowerRecipientService flowerRecipientService;

	@GetMapping("")
	public String filterProducts(@RequestParam(required = false) Long categoryId,
			@RequestParam(required = false) Long colorId, @RequestParam(required = false) Long recipientId,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size, ModelMap model) {
		Pageable pageable = PageRequest.of(page, size);

		// Lọc sản phẩm dựa trên tiêu chí
		Page<Product> productPage = productService.filterProducts(categoryId, colorId, recipientId, pageable);

		// Lấy danh sách category, color, và recipient để hiển thị sidebar
		List<Category> categories = categoryService.findAll();
		List<FlowerColor> colors = flowerColorService.findAll();
		List<FlowerRecipient> recipients = flowerRecipientService.findAll();

		// Đưa dữ liệu vào model
		model.addAttribute("productPage", productPage);
		model.addAttribute("categories", categories);
		model.addAttribute("colors", colors);
		model.addAttribute("recipients", recipients);

		// Lưu trạng thái của các bộ lọc để giữ trên giao diện
		model.addAttribute("selectedCategory", categoryId);
		model.addAttribute("selectedColor", colorId);
		model.addAttribute("selectedRecipient", recipientId);

		return "buyer/product-list"; // Tên file JSP để hiển thị danh sách sản phẩm
	}

}
