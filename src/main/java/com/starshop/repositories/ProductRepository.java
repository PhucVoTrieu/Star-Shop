package com.starshop.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.starshop.entities.Product;

import jakarta.validation.Valid;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
	
	    @Query("SELECT p FROM Product p WHERE " +
	           "(:categoryId IS NULL OR p.category.id = :categoryId) AND " +
	           "(:colorId IS NULL OR p.color.id = :colorId) AND " +
	           "(:recipientId IS NULL OR p.recipient.id = :recipientId)")
	    Page<Product> filterByCriteria(
	        @Param("categoryId") Long categoryId,
	        @Param("colorId") Long colorId,
	        @Param("recipientId") Long recipientId,
	        Pageable pageable
	    );
	

	
	
	@Query("SELECT p FROM Product p WHERE p.isPublished = true")
	List<Product> findAllPublished();

	// Lấy sản phẩm mới nhất
	@Query("SELECT p FROM Product p ORDER BY p.createdDate DESC")
	List<Product> findTopByOrderByCreatedDateDesc(Pageable pageable);

}
