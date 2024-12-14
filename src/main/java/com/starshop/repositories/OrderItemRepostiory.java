package com.starshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.OrderItem;

@Repository
public interface OrderItemRepostiory extends JpaRepository<OrderItem, Long>{
	
}
