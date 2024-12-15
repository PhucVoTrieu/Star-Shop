package com.starshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
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
@Table(name = "compare_list")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CompareList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "buyer_id", nullable = false)
    private Integer buyerID;

    @Column(name = "product_1_id")
    private Long product1ID;

    @Column(name = "product_2_id")
    private Long product2ID;

    @Column(name = "product_3_id")
    private Long product3ID;

    // Getter và Setter
}
