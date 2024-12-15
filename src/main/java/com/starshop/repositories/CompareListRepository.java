package com.starshop.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.entities.CompareList;

@Repository
public interface CompareListRepository extends JpaRepository<CompareList, Long> {

	Optional<CompareList> findByBuyerID(int buyerID);

	
}
