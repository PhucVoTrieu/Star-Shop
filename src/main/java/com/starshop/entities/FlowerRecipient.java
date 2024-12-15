package com.starshop.entities;

import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "flower_recipients")
public class FlowerRecipient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "name", length = 100, nullable = false, unique = true)
	private String name; // Đối tượng tặng hoa (ví dụ: Người yêu, Mẹ, Bạn bè)
	
	 @OneToMany(mappedBy = "recipient", cascade = CascadeType.ALL)
	    private List<Product> products; // Danh sách sản phẩm có người nhận này


	 
}
