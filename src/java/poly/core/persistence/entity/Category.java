package poly.core.persistence.entity;
// Generated Oct 10, 2018 8:57:07 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private int id;
     private String name;
     private int sortOrder;
     private Category parentCategory;
     private Set<Category> childCategories = new HashSet<Category>(0);
     private Set<Product> products = new HashSet<Product>(0);

    public Category() {
    }

	
    public Category(int id, String name, int sortOrder) {
        this.id = id;
        this.name = name;
        this.sortOrder = sortOrder;
    }
    public Category(int id, Category category, String name, int sortOrder, Set<Category> childCategories, Set<Product> products) {
       this.id = id;
       this.name = name;
       this.sortOrder = sortOrder;
       this.childCategories = childCategories;
       this.products = products;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public int getSortOrder() {
        return this.sortOrder;
    }
    
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }
    
    public Category getParentCategory() {
        return this.parentCategory;
    }
    
    public void setParentCategory(Category parentCategory) {
        this.parentCategory = parentCategory;
    }
    
    public Set<Category> getChildCategories() {
        return this.childCategories;
    }
    
    public void setChildCategories(Set<Category> childCategories) {
        this.childCategories = childCategories;
    }
    public Set<Product> getProducts() {
        return this.products;
    }
    
    public void setProducts(Set<Product> products) {
        this.products = products;
    }




}


