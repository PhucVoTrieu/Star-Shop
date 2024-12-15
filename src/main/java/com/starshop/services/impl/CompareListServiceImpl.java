package com.starshop.services.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.entities.CompareList;
import com.starshop.entities.Product;
import com.starshop.repositories.AddressRepository;
import com.starshop.repositories.BuyerRepository;
import com.starshop.repositories.CompareListRepository;
import com.starshop.repositories.ProductRepository;
import com.starshop.services.AddressService;
import com.starshop.services.CompareListService;

@Service
public class CompareListServiceImpl implements CompareListService{
	@Autowired
	CompareListRepository compareListRepository;
	@Autowired
	ProductRepository productRepository;
	
	@Override
	public List<Product> getProductsFromCompareList(CompareList compareList) {
	    List<Long> productIds = Arrays.asList(
	        compareList.getProduct1ID(),
	        compareList.getProduct2ID(),
	        compareList.getProduct3ID()
	    );

	    // Lọc các ID không null và truy vấn sản phẩm
	    return productRepository.findAllById(productIds.stream().filter(Objects::nonNull).collect(Collectors.toList()));
	}
	 
	 @Override
	public Optional<CompareList> findByBuyerID(int buyerID) {
		return compareListRepository.findByBuyerID(buyerID);
	}


	@Override
	public CompareList getCompareListByBuyer(int buyerID) {
	        return compareListRepository.findByBuyerID(buyerID)
	                .orElse(new CompareList());
	    }
	 
	@Override
	public <S extends CompareList> S save(S entity) {
		return compareListRepository.save(entity);
	}

	@Override
	public List<CompareList> findAll() {
		return compareListRepository.findAll();
	}

	@Override
	public Optional<CompareList> findById(Long id) {
		return compareListRepository.findById(id);
	}

	@Override
	public void deleteById(Long id) {
		compareListRepository.deleteById(id);
	}

	
	
	
}
