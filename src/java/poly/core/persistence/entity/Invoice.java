package poly.core.persistence.entity;
// Generated Oct 10, 2018 4:53:13 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Invoice generated by hbm2java
 */
public class Invoice  implements java.io.Serializable {


     private int id;
     private Cart cart;
     private Date createdDate;
     private Integer status;

    public Invoice() {
    }

	
    public Invoice(int id, Cart cart, Date createdDate) {
        this.id = id;
        this.cart = cart;
        this.createdDate = createdDate;
    }
    public Invoice(int id, Cart cart, Date createdDate, Integer status) {
       this.id = id;
       this.cart = cart;
       this.createdDate = createdDate;
       this.status = status;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Cart getCart() {
        return this.cart;
    }
    
    public void setCart(Cart cart) {
        this.cart = cart;
    }
    public Date getCreatedDate() {
        return this.createdDate;
    }
    
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }




}


