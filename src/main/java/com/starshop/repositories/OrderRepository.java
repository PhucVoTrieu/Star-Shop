package com.starshop.repositories;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.starshop.entities.Buyer;
import com.starshop.entities.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    

	List<Order> findByBuyer(Buyer buyer);
}