package com.starshop.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.starshop.entities.User;
import com.starshop.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;

	public UserService(UserRepository repository) {
		
		this.userRepository = repository;
	}
	public List<User> allUsers(){
		List<User> users = new ArrayList<>();
		
		userRepository.findAll().forEach(users::add);
		
		return users;
	}
	public List<User> findAll() {
		return userRepository.findAll();
	}
}
