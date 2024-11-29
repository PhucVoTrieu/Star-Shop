package com.starshop.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.Buyer;
import com.starshop.entities.ShoppingCart;


@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart	,Long>{
	Optional<ShoppingCart> findByBuyer(Buyer buyer);
	Optional<ShoppingCart> findByCartId(Long cartID);
}
