package com.learn.mycart.entities;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Receipt 
{
    @Id
    private String order_id;
    
    private String payment_id;
    private String receipt_id;
    private Timestamp create_date;
    private double bill_amount;
    private String bill_status;
    private int total_items;
    
    @ManyToOne
    private User user;
    
    @OneToMany(mappedBy = "receipt", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<OrderItem> orderItems = new ArrayList<>();

    public Receipt(String order_id, String payment_id, String receipt_id, Timestamp create_date, double bill_amount, String bill_status, int total_items, User user) {
        this.order_id = order_id;
        this.payment_id = payment_id;
        this.receipt_id = receipt_id;
        this.create_date = create_date;
        this.bill_amount = bill_amount;
        this.bill_status = bill_status;
        this.total_items = total_items;
        this.user = user;
    }

    public Receipt(String payment_id, String receipt_id, Timestamp create_date, double bill_amount, String bill_status, int total_items, User user) {
        this.payment_id = payment_id;
        this.receipt_id = receipt_id;
        this.create_date = create_date;
        this.bill_amount = bill_amount;
        this.bill_status = bill_status;
        this.total_items = total_items;
        this.user = user;
    }

    public Receipt() {
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    @Override
    public String toString() {
        return "Receipt{" + "order_id=" + order_id + ", payment_id=" + payment_id + ", receipt_id=" + receipt_id + ", create_date=" + create_date + ", bill_amount=" + bill_amount + ", bill_status=" + bill_status + ", total_items=" + total_items + ", user=" + user + ", orderItems=" + orderItems + '}';
    }

    public String getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }

    public String getReceipt_id() {
        return receipt_id;
    }

    public void setReceipt_id(String receipt_id) {
        this.receipt_id = receipt_id;
    }

    public Timestamp getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Timestamp create_date) {
        this.create_date = create_date;
    }

    public double getBill_amount() {
        return bill_amount;
    }

    public void setBill_amount(double bill_amount) {
        this.bill_amount = bill_amount;
    }

    public String getBill_status() {
        return bill_status;
    }

    public void setBill_status(String bill_status) {
        this.bill_status = bill_status;
    }

    public int getTotal_items() {
        return total_items;
    }

    public void setTotal_items(int total_items) {
        this.total_items = total_items;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
    
    
    
    
    
    
    
    
    
    
    
}
