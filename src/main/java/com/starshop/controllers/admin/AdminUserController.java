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
import org.springframework.web.bind.annotation.GetMapping;
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
import com.starshop.repositories.BuyerRepository;
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
@RequestMapping("/admin/users")
public class AdminUserController {
	
	@Autowired
    private BuyerService buyerService;

    @GetMapping("")
    public String getUsers(Model model) {
        List<Buyer> users = buyerService.findAll();  // Lấy tất cả người dùng
        model.addAttribute("users", users);  // Truyền danh sách vào view
        return "admin/user-management";  // Tên của trang HTML (userList.html)
    }	
	

}