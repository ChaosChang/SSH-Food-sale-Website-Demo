/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Chef;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface ChefDao {
    public void saveChef(Chef chef);

    public void deleteChef(Chef chef);

    public void updateChef(Chef chef);

    public List search();
}
