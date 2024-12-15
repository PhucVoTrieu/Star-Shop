package com.starshop.entities;

import java.util.List;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "flower_colors")
public class FlowerColor {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "color_name", length = 50, nullable = false, unique = true)
	private String colorName; // Tên màu sắc (ví dụ: đỏ, trắng, vàng)
	
	
	 @OneToMany(mappedBy = "color", cascade = CascadeType.ALL)
	    private List<Product> products; // Danh sách sản phẩm có màu nà
	 
	 @Override
	    public int hashCode() {
	        return Objects.hash(id, colorName); // use only primary fields
	    }
}
