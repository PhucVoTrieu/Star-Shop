package com.starshop.services;

import java.util.List;
import java.util.Optional;

import com.starshop.entities.Category;

public interface CategoryService {
	List<Category> findAll();

	Optional<Category> findById(Long id);
	
}
