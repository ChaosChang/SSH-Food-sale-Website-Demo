/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Adminster;
import example.Bean.Userinfo;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class LoginDaoImpl implements LoginDao{
    public void deleteLogin(Userinfo user) {
		HibernateUtil.delete(user);
	}

	public Adminster findLogin(int id) {
		return (Adminster) HibernateUtil.findById(Adminster.class, id);
	}

	public Adminster findLogin(String name) {
		return (Adminster) HibernateUtil.findByName(name);
	}

	public void saveLogin(Userinfo user) {
		HibernateUtil.add(user);
	}

	public void updateLogin(Userinfo user) {
		HibernateUtil.update(user);
	}
        
        public List find(Adminster login){
            return (List)HibernateUtil.find(login);
        }
        
        public List find(Userinfo login){
            return (List)HibernateUtil.find(login);
        }
        
        public List search(){
            String hql="select u from Userinfo u";
            return HibernateUtil.search(hql);
        }
}
