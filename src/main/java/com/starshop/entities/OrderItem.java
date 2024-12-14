package com.starshop.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "order_items")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderItemID;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;


    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cart_item_id", nullable = false)
    private CartItem cartItem; // Mỗi OrderItem liên kết với một CartItem

    private int quantity;

    private Double price; // Giá của sản phẩm tại thời điểm đặt hàng
}
