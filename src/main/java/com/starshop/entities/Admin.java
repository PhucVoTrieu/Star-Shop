package com.starshop.entities;

import java.io.Serializable;
import java.util.List;

import com.starshop.enums.Role;

import jakarta.persistence.CascadeType;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Entity
@Data
@DiscriminatorValue("ADMIN")
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder
public class Admin extends User implements Serializable {

    private static final long serialVersionUID = 1L;
    

    @Override
    public String getRole() {
        return Role.ADMIN.name();
    }

    @Override
    public String toString() {
        return "Admin[] ";
    }
}
