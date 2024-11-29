package com.starshop.services;

import java.util.List;

import com.starshop.entities.Order;

public interface OrderService {

    void updateOrderStatus(Long orderId, String newStatus);
    void bulkUpdateOrderStatus(List<Long> orderIds, String newStatus);
    
    String cancelOrder(Long orderId);
    void placeOrder(Order order);
}