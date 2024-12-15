package com.starshop.configs;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.starshop.entities.Admin;
import com.starshop.entities.Order;
import com.starshop.repositories.UserRepository;
import com.starshop.services.AdminService;
import com.starshop.services.OrderService;
import com.starshop.services.ProductService;
import com.starshop.services.UserService;

@Configuration
public class ApplicationInitConfig {
	@Bean
	ApplicationRunner applicationRunner(AdminService adminService, PasswordEncoder passwordEncoder) {
		return args-> {
			if(!adminService.existAdminAccount()) {
			Admin admin = new Admin();
			admin.setCreatedAt(new Date());
			admin.setPassword(passwordEncoder.encode("admin"));
			admin.setEmail("admin@gmail.com");
			admin.setFullName("admin");


			adminService.save(admin);
		}
		
		};
	}
}
