package com.starshop.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.starshop.entities.CartItem;
import com.starshop.entities.Product;
import com.starshop.entities.ShoppingCart;


@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
	// Tìm CartItem dựa vào Cart và Product (nếu cần kiểm tra xem item đã tồn tại trong giỏ hàng chưa)
    Optional<CartItem> findByShoppingCartAndProduct(ShoppingCart cart, Product product);
    
    @Modifying
    @Transactional
    @Query(value = "UPDATE cart_items SET quantity = :quantity WHERE id = :cartItemId", nativeQuery = true)
    int updateQuantity(@Param("cartItemId") Long cartItemId, @Param("quantity") int quantity);
    
    @Transactional
    void deleteByShoppingCart(ShoppingCart cart); // Xóa tất cả các CartItem liên kết với giỏ hàng

}
