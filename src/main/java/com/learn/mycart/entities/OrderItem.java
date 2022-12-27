package com.learn.mycart.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class OrderItem
{
    @Id
    private int orderItem_id;
    private int pId;
    @ManyToOne
    private Receipt receipt;
    private int pPrice;

    public OrderItem(int orderItem_id, int pId, Receipt receipt, int pPrice) {
        this.orderItem_id = orderItem_id;
        this.pId = pId;
        this.receipt = receipt;
        this.pPrice = pPrice;
    }

    public OrderItem(int pId, Receipt receipt, int pPrice) {
        this.pId = pId;
        this.receipt = receipt;
        this.pPrice = pPrice;
    }

    public OrderItem() {
    }

    public int getOrderItem_id() {
        return orderItem_id;
    }

    public void setOrderItem_id(int orderItem_id) {
        this.orderItem_id = orderItem_id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "orderItem_id=" + orderItem_id + ", pId=" + pId + ", receipt=" + receipt + ", pPrice=" + pPrice + '}';
    }

    
    
    
}
