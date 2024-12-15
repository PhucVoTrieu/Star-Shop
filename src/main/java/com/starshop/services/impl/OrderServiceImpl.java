package com.starshop.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.Buyer;
import com.starshop.entities.CartItem;
import com.starshop.entities.Order;
import com.starshop.entities.OrderItem;
import com.starshop.entities.ShoppingCart;
import com.starshop.repositories.OrderItemRepostiory;
import com.starshop.repositories.OrderRepository;
import com.starshop.repositories.ShoppingCartRepository;
import com.starshop.services.OrderService;

import jakarta.validation.Valid;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Override
	public boolean hasBuyerPurchasedProduct(Buyer buyer, Long productId) {
        List<Order> orders = orderRepository.findByBuyer(buyer);
        
        for (Order order : orders) {
            for (OrderItem orderItem : order.getOrderItems()) {
                if (orderItem.getProduct().getId().equals(productId)) {
                    return true; // Nếu sản phẩm nằm trong đơn hàng
                }
            }
        }

        return false; // Nếu không tìm thấy
    }

	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public <S extends Order> S save(S entity) {
		return orderRepository.save(entity);
	}



	@Override
	public Optional<Order> findById(Long id) {
		return orderRepository.findById(id);
	}

    

    
}

