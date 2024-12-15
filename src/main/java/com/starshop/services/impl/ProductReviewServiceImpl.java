package com.starshop.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.starshop.entities.Product;
import com.starshop.entities.ProductReview;
import com.starshop.repositories.ProductReviewRepository;
import com.starshop.services.ProductReviewService;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {

	@Autowired
	ProductReviewRepository reviewRepo;
	
	

	
	
	@Override
	public boolean existsByBuyerIdAndProductId(int buyerId, Long productId) {
		return reviewRepo.existsByBuyerIdAndProductId(buyerId, productId);
	}

	@Override
	public void deleteById(Integer id) {
		reviewRepo.deleteById(id);
	}

	@Override
	public Optional<ProductReview> findById(int id) {
		return reviewRepo.findById(id);
	}

	@Override
	public Page<ProductReview> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductReview> findAll() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ProductReview addReview(int productId, int rating, String content) {
		
		return null;
	}



	@Override
	public boolean editReview(int reviewId) {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public <S extends ProductReview> S save(S entity) {
		// TODO Auto-generated method stub
		return reviewRepo.save(entity);
	}



	@Override
	public Optional<ProductReview> getReviewByBuyerAndProduct(Long buyerId, Long productId) {
		return reviewRepo.findByBuyerIdAndProductId(buyerId, productId);
	}
	
}
