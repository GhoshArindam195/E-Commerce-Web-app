package com.learn.mycart.dao;

import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            return f;
        }
        return f;
    }

    public List<Product> getAllProducts() {
        List<Product> products = null;

        try {
            Session session = this.factory.openSession();
            Query query = session.createQuery("from Product");
            products = query.list();

        } catch (Exception e) {
            e.printStackTrace();
            return products;
        }

        return products;
    }

    public List<Product> getProductsByCategoryId(int cId) {
        List<Product> products = null;
        
        try
        {
            Session session = this.factory.openSession();
            Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
            query.setParameter("id", cId);
            products = query.list();
            session.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return products;
        }
        
        return products;

    }
}
