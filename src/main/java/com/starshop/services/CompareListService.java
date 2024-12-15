package com.starshop.services;

import java.util.List;
import java.util.Optional;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.entities.CompareList;
import com.starshop.entities.Product;

public interface CompareListService {

	void deleteById(Long id);

	Optional<CompareList> findById(Long id);

	List<CompareList> findAll();

	<S extends CompareList> S save(S entity);

	CompareList getCompareListByBuyer(int buyerID);

	

	Optional<CompareList> findByBuyerID(int buyerID);

	List<Product> getProductsFromCompareList(CompareList compareList);

	





	
}
