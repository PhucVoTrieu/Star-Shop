package com.starshop.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "productReviews")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductReview implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // Tự động tăng
	@Column(name = "reviewId")
	private int reviewId;
	
	@ManyToOne
    @JoinColumn(name = "productId", nullable = false) // Khóa ngoại tới bảng Product
    private Product product;

    @ManyToOne
    @JoinColumn(name = "buyerId", nullable = true) // Khóa ngoại tới bảng Buyer
    private Buyer buyer;
	@Column(name="rating")
	private int rating;
	@Column(name="reviewContent", columnDefinition="nvarchar(500)")
	private String reviewContent;
	@Column(name="reviewDate")
	private Date reviewDate;
	@Override
	public String toString() {
		return "ProductReview []";
	}
	
	 @Transient // Không lưu vào DB
	   private boolean canDelete;

	
}
