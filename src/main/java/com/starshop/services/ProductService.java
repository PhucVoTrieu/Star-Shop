package com.starshop.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.starshop.entities.Product;

import jakarta.validation.Valid;

public interface ProductService {

	Page<Product> findAll(Pageable pageable);

	Optional<Product> findById(Long id);

	List<Product> findTopByOrderByCreatedDateDesc(Pageable pageable);

	List<Product> findAll();

	void deleteById(Long id);

	<S extends Product> S save(S entity);

	List<Product> getTopRatedProducts(int limit);

	Page<Product> filterProducts(Long categoryId, Long colorId, Long recipientId, Pageable pageable);


	
}
