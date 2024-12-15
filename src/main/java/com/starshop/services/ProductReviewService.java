package com.starshop.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.starshop.entities.ProductReview;


public interface ProductReviewService {

	
	ProductReview addReview(int productId,int rating,String content);

	boolean editReview(int reviewId);
	//void deleteById(Long id);

	//long count();

	//<S extends ProductReview> Optional<S> findOne(Example<S> example);

	Optional<ProductReview> findById(int reviewId);

	//List<ProductReview> findAllById(Iterable<Long> ids);

	//List<ProductReview> findAll(Sort sort);

	Page<ProductReview> findAll(Pageable pageable);

	List<ProductReview> findAll();

	<S extends ProductReview> S save(S entity);

	//Page<ProductReview> findByCategoryNameContaining(String name, Pageable pageable);

	//List<ProductReview> findByCategoryNameContaining(String name);
	
	public Optional<ProductReview> getReviewByBuyerAndProduct(Long buyerId, Long productId);

	void deleteById(Integer id);

	boolean existsByBuyerIdAndProductId(int integer, Long productId);
    
}
