
package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitile;
    private String categoryDescription;
    
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();

    //constructor including id
    public Category(int categoryId, String categoryTitile, String categoryDescription, List<Product> products) {
        this.categoryId = categoryId;
        this.categoryTitile = categoryTitile;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }
    
    //constructor excluding id
    public Category(String categoryTitile, String categoryDescription, List<Product> products) {
        this.categoryTitile = categoryTitile;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }
    
    //deafult constructor
    public Category() {
    }
    
    
    //Getters and setters
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitile() {
        return categoryTitile;
    }

    public void setCategoryTitile(String categoryTitile) {
        this.categoryTitile = categoryTitile;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    
    //toString method
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitile=" + categoryTitile + ", categoryDescription=" + categoryDescription + ", products=" + products + '}';
    }
    
    
    
    
    
    
    
    
    
    
}
