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

	@Query("SELECT p FROM Product p WHERE p.isPublished = true")
	List<Product> findAllPublished();

	// Lấy sản phẩm mới nhất
	@Query("SELECT p FROM Product p ORDER BY p.createdDate DESC")
	List<Product> findTopByOrderByCreatedDateDesc(Pageable pageable);

}
