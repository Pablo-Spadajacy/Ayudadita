package com.codingdojo.ayudadita.modelos;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="products")
public class Product {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Product title is required.")
	private String title;
	
	
	@NotNull(message="Product price is required")
	private String price;
	
	@NotEmpty(message="Product Location is required.")
	private String productLocation;
	
	@NotEmpty(message="Product description is required.")
	private String productDescription;

    private String img;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "creator_id")
    private Usuario creator;
    

    public Product() {
    }

    public Product(String title,
            String price,
            String productLocation,
            String productDescription, Usuario creator, Date createdAt,
            Date updatedAt) {
        this.title = title;
        this.price = price;
        this.productLocation = productLocation;
        this.productDescription = productDescription;
        this.creator = creator;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Product(Long id, String title,
            String price,
           String productLocation,
            String productDescription, Usuario creator, Date createdAt,
            Date updatedAt) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.productLocation = productLocation;
        this.productDescription = productDescription;
        this.creator = creator;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setProductLocation(String productLocation) {
        this.productLocation = productLocation;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getPrice() {
        return price;
    }

    public String getProductLocation() {
        return productLocation;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

    public Usuario getCreator() {
        return creator;
    }

    public void setCreator(Usuario creator) {
        this.creator = creator;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
	
	
}
