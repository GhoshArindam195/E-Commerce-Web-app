package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveCategory(Category cat) {
        boolean f = false;

        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
                session.save(cat);
            tx.commit();
            session.clear();
            f=true;

        } catch (Exception e) 
        {
            e.printStackTrace();
            return f;
        }

        return f;
    }
    
    public List<Category> getAllCategories()
    {
        List<Category> categories=null;
        try
        {
            Session session = this.factory.openSession();
            
            
            Query q = session.createQuery("from Category");
            categories = q.list();
            
            
            session.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return categories;
        }
        return categories;
        
    }
    
    public Category getCategoryByCategoryId(int cId)
    {
        Category cat=null;
        try 
        {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cId);
            session.close();
            
        } catch (Exception e) 
        {
            e.printStackTrace();
            return cat;
        }
        return cat;
    }

}
