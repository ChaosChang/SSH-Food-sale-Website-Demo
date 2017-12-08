/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Adminster;
import example.Bean.Userinfo;
import example.Dao.LoginDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class LoginServiceImpl implements LoginService{
    private LoginDao loginDao;

	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	public void delete(Userinfo user) {
		loginDao.deleteLogin(user);
	}

	public Adminster findById(int id) {
		return loginDao.findLogin(id);
	}

	public Adminster findByName(String name) {
		return loginDao.findLogin(name);
	}

	public void save(Userinfo user) {
		loginDao.saveLogin(user);
	}

	public void update(Userinfo user) {
		loginDao.updateLogin(user);
	}
        public Adminster find(Adminster login){
            List l=loginDao.find(login);
            if(l!=null&&l.size()==1){
			return (Adminster)l.get(0);
		}else{
			return null;
		}
        }
        public Userinfo find(Userinfo login){
            List l=loginDao.find(login);
            if(l!=null&&l.size()==1){
			return (Userinfo)l.get(0);
		}else{
			return null;
		}
        }
        
        public List search(){
            List l=loginDao.search();
            if(l!=null)
            {
                return l;
            }
            return null;
        }
}
