package com.starshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
