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
	public Page<Product> filterProducts(Long categoryId, Long colorId, Long recipientId, Pageable pageable) {
	        return productRepo.filterByCriteria(categoryId, colorId, recipientId, pageable);
	    }
	 @Override
	public List<Product> getTopRatedProducts(int limit) {
	        return productRepo.findAll().stream()
	                .filter(product -> product.getReviews() != null && !product.getReviews().isEmpty()) // Chỉ lấy sản phẩm có đánh giá
	                .sorted((p1, p2) -> Double.compare(p2.getAverageRating(), p1.getAverageRating())) // Sắp xếp giảm dần theo rating
	                .limit(limit) // Lấy số lượng sản phẩm cần thiết
	                .toList();
	    }
	 
	@Override
	public <S extends Product> S save(S entity) {
		return productRepo.save(entity);
	}

	@Override
	public Page<Product> findAll(Pageable pageable) {
		return productRepo.findAll(pageable);
	}

	@Override
	public List<Product> findAll() {
		return productRepo.findAll();
	}

	@Override
	public Optional<Product> findById(Long id) {
		return productRepo.findById(id);
	}

	@Override
	public void deleteById(Long id) {
		productRepo.deleteById(id);
	}

	@Override
	public List<Product> findTopByOrderByCreatedDateDesc(Pageable pageable) {
		return productRepo.findTopByOrderByCreatedDateDesc(pageable);
	}
	
	
	
}
