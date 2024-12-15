package com.starshop.entities;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "users")
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "role")
@FieldDefaults(level = AccessLevel.PROTECTED)
@SuperBuilder
public class User implements UserDetails {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(nullable = false)
	private Integer id;
	@Column(nullable = false, columnDefinition = "nvarchar(50)")
	private String fullName;
	@Column(unique = true, length = 100, nullable = false)
	private String email;
	@Column(columnDefinition = "nvarchar(500)", nullable = true)
	private String images;
	@Column(nullable = false)
	private String password;
	@CreationTimestamp
	@Column(updatable = false, name = "created_at")
	private Date createdAt;
	@UpdateTimestamp
	@Column(name = "updated_at")
	private Date updatedAt;
	
	@ManyToOne
	@JoinColumn(name = "admin_id")
	private Admin admin;

	public String getRole() {
        return this.getClass().getSimpleName();
    }

	 	@Override
	    public Collection<? extends GrantedAuthority> getAuthorities() {
	 		String role = getRole(); // Lấy role từ phương thức getRole()
	 	    return List.of(new SimpleGrantedAuthority("ROLE_" + role));
	    }

	    @Override
	    public String getPassword() {
	        return password;
	    }

	    @Override
	    public String getUsername() {
	        return email;
	    }

	    @Override
	    public boolean isAccountNonExpired() {
	        return true; // Kiểm tra nếu tài khoản đã hết hạn
	    }

	    @Override
	    public boolean isAccountNonLocked() {
	        return true; // Kiểm tra nếu tài khoản bị khóa
	    }

	    @Override
	    public boolean isCredentialsNonExpired() {
	        return true; // Kiểm tra nếu thông tin đăng nhập đã hết hạn
	    }

	    @Override
	    public boolean isEnabled() {
	        return true; // Kiểm tra nếu tài khoản đang hoạt động
	    }
}
