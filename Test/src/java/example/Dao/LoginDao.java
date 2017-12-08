/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Adminster;
import example.Bean.Userinfo;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface LoginDao {

    public void saveLogin(Userinfo user);

    public void deleteLogin(Userinfo user);

    public void updateLogin(Userinfo user);

    public Adminster findLogin(int id);

    public Adminster findLogin(String name);

    public List find(Adminster login);

    public List find(Userinfo login);

    public List search();
}
