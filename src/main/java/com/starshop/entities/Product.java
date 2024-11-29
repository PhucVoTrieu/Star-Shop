package com.starshop.entities;

import java.util.List;
import java.util.stream.Collectors;

import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "products", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(length = 100, nullable = false)
	private String name;

	@Column(nullable = false)
	private double price;

	private String description;

	private Integer stock; // Số lượng hoa còn trong kho
	private String imageUrl; // Hình ảnh hoa (URL của ảnh hoặc dữ liệu ảnh)

	private String color; // Màu sắc của hoa
	private String size; // Kích thước (nếu có, như hoa nhỏ, trung bình, lớn)

	@Column(name = "is_published", nullable = false)
	private Boolean isPublished = true; // Mặc định là công khai

	@ManyToOne
	@JoinColumn(name = "category_id") // khóa ngoại "category_id"
	private Category category;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<ProductReview> reviews; // Đánh giá sản phẩm

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Favorite> favorites; // Sản phẩm yêu thích

}
