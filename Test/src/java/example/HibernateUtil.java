/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example;

import example.Bean.Adminster;
import example.Bean.Userinfo;
import java.io.Serializable;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author T5-SKYLAKE
 */
public class HibernateUtil {

    private static SessionFactory sf;

    static {
        Configuration cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        sf = cfg.buildSessionFactory();
    }

    public static Session getSession() {
        return sf.openSession();
    }

    //增
    public static void add(Object entity) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSession();
            tx = session.beginTransaction();
            session.save(entity);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    //删
    public static void delete(Object entity) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSession();
            tx = session.beginTransaction();
            session.delete(entity);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    
    //改
    public static void update(Object entity) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSession();
            tx = session.beginTransaction();
            session.update(entity);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public static Object findById(Class clazz, Serializable id) {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            Object ob = session.get(clazz, id);
            return ob;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public static Object findByName(String name) {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            Query query = session.createQuery("from test where name = :name");
            query.setParameter("name", name);
            Object ob = query.uniqueResult();
            return ob;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    //管理员登录
    public static Object find(Adminster entity) {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            Query query = session.createQuery("from Adminster a where a.adname=? and a.adpw=?");//查询
            query.setParameter(0, entity.getAdname());
            query.setParameter(1, entity.getAdpw());
            List ob = query.list();//匹配有就返回有内容的值，无就无了吧
            return ob;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    //用户登录
    public static Object find(Userinfo entity) {
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            Query query = session.createQuery("from Userinfo a where a.username=? and a.userpw=?");//查询
            query.setParameter(0, entity.getUsername());
            query.setParameter(1, entity.getUserpw());
            List ob = query.list();//匹配有就返回有内容的值，无就无了吧
            return ob;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    //表查询
    public static List search(String hql){
        Session session=null;
        try{
            session=HibernateUtil.getSession();
            Query query=session.createQuery(hql);
            List ob=query.list();
            return ob;
        } catch(HibernateException e){
            e.printStackTrace();
            throw e;
        } finally{
            if(session!=null){
                session.close();
            }
        }
    }
}
