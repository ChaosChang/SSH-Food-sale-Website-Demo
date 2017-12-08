/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Adminster;
import example.Bean.Userinfo;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface LoginService {

    public void save(Userinfo user);

    public void delete(Userinfo user);

    public void update(Userinfo user);

    public Adminster findById(int id);

    public Adminster findByName(String name);
    
    public Adminster find(Adminster login);
    
    public Userinfo find(Userinfo login);
    
    public List search();
}
