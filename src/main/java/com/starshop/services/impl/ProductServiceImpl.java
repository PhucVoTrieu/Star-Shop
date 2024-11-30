package com.starshop.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.starshop.entities.Product;
import com.starshop.entities.ProductSpecification;
import com.starshop.repositories.ProductRepository;
import com.starshop.services.ProductService;

import jakarta.validation.Valid;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductRepository productRepo;

	@Override
	public Page<Product> findAll(Pageable pageable) {
		return productRepo.findAll(pageable);
	}

	@Override
	public Optional<Product> findById(Long id) {
		return productRepo.findById(id);
	}

	@Override
	public List<Product> findTopByOrderByCreatedDateDesc(Pageable pageable) {
		return productRepo.findTopByOrderByCreatedDateDesc(pageable);
	}
	
	
	
}
