
package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "user_id")
    private int userId;
    
    @Column(length = 100, name = "user_name")
    private String userName;
    
    @Column(length = 100, name = "user_email")
    private String userEmail;
    
    @Column(length = 100, name = "user_password")
    private String userPassword;
    
    @Column(length = 20, name = "user_phone")
    private String userPhone;
    
    @Column(length = 1500, name = "user_pic")
    private String userPic;
    
    @Column(length = 1500, name = "user_address")
    private String userAddress;
    
    @Column(length = 100, name = "user_Type")
    private String userType;
    
    @OneToMany(mappedBy = "user")
    private List<Receipt> receipts = new ArrayList<>();

    //constructor including id
    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, String userType, List<Receipt> receipts) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
        this.receipts = receipts;
    }

    public List<Receipt> getReceipts() {
        return receipts;
    }

    public void setReceipts(List<Receipt> receipts) {
        this.receipts = receipts;
    }

    //constructor excluding id
    public User(String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress, String userType, List<Receipt> receipts) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
        this.receipts = receipts;
    }

    //default constructor
    public User() {
    }
    
    

    //Getters and setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    //toString method
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }
    
    
    
    
    
    
    
    
    
}
