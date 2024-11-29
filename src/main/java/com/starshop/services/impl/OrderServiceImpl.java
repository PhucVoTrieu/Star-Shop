package com.starshop.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.starshop.entities.Order;
import com.starshop.entities.OrderDetail;
import com.starshop.repositories.OrderDetailRepository;
import com.starshop.repositories.OrderRepository;
import com.starshop.services.OrderService;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;
    
    @Override
    public void placeOrder(Order order) {
        // Lưu đơn hàng trước
        orderRepository.save(order);

        // Lưu các chi tiết đơn hàng
        for (OrderDetail detail : order.getItems()) {
            detail.setOrder(order); // Đảm bảo mỗi detail gắn với order
            orderDetailRepository.save(detail);
        }
    }

	@Override
	public String cancelOrder(Long orderId) {
		Optional<Order> order = orderRepository.findById(orderId);
		if(order.isPresent()) {
			Order editOrder =order.get();
			if(editOrder.getStatus().equalsIgnoreCase("Done")) {
				return "Đơn hàng đã giao";
			}else if(editOrder.getStatus().equalsIgnoreCase("Pending")){
				editOrder.setStatus("Canceled");
				orderRepository.save(editOrder);
				return "Huỷ đơn thành công";
			}
			
		}
		return "loi";
	}


	@Override
	public void updateOrderStatus(Long orderId, String newStatus) {
	    Optional<Order> orderOpt = orderRepository.findById(orderId);
	    if (orderOpt.isPresent()) {
	        Order order = orderOpt.get();
	        // Kiểm tra nếu status mới khác status hiện tại
	        if (!newStatus.equals(order.getStatus())) {
	            order.setStatus(newStatus); // Chỉ set status mới, không nối chuỗi
	            orderRepository.save(order);
	        }
	    }
	}

	@Override
	@Transactional
	public void bulkUpdateOrderStatus(List<Long> orderIds, String newStatus) {
	    for (Long orderId : orderIds) {
	        Optional<Order> orderOpt = orderRepository.findById(orderId);
	        if (orderOpt.isPresent()) {
	            Order order = orderOpt.get();
	            // Kiểm tra nếu status mới khác status hiện tại
	            if (!newStatus.equals(order.getStatus())) {
	                order.setStatus(newStatus); // Chỉ set status mới, không nối chuỗi
	                orderRepository.save(order);
	            }
	        }
	    }
	}

}