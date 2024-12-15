package com.starshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.FlowerColor;

@Repository
public interface FlowerColorRepository extends JpaRepository<FlowerColor, Long>{

}
