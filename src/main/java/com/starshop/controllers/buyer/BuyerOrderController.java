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

import com.starshop.entities.Buyer;
import com.starshop.entities.Order;
import com.starshop.entities.OrderDetail;
import com.starshop.entities.Product;
import com.starshop.services.OrderService;
import com.starshop.services.ProductService;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/buyer/orders")  // Thêm prefix /buyer để phân biệt với admin
public class BuyerOrderController {
    
    @Autowired
    private OrderService orderService;
    @Autowired
	ProductService productService;
    
    // Hiển thị danh sách/lịch sử đơn hàng (gộp 2 phương thức getPurchaseHistory và getMyOrders)
   

	
}