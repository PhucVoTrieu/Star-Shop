package com.starshop.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.starshop.entities.Buyer;
import com.starshop.entities.ShoppingCart;
import com.starshop.entities.User;
import com.starshop.model.LoginUserModel;
import com.starshop.model.RegisterUserModel;
import com.starshop.repositories.BuyerRepository;
import com.starshop.repositories.UserRepository;

@Service
public class AuthenticationService {
	private final UserRepository userRepository;
	@Autowired
	private  BuyerRepository buyerRepository;
	private final PasswordEncoder passwordEncoder;
	private final AuthenticationManager authenticationManager;

	public AuthenticationService(UserRepository userRepository, AuthenticationManager authenticationManager,
			PasswordEncoder passwordEncoder) {
		this.authenticationManager = authenticationManager;
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
	}

	public User signup(RegisterUserModel input) {
		Buyer buyer = new Buyer();
		buyer.setFullName(input.getFullName());
		buyer.setEmail(input.getEmail());
		buyer.setPassword(passwordEncoder.encode(input.getPassword()));
		buyer.setPhoneNumber(input.getPhoneNumber());
//		ShoppingCart cart = new ShoppingCart();
//		buyer.setShoppingCart(cart);
		return buyerRepository.save(buyer);
	}

	public User authenticate(LoginUserModel input) {
		authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(input.getEmail(), input.getPassword()));
		
		return userRepository.findByEmail(input.getEmail()).orElseThrow();
	}
}
