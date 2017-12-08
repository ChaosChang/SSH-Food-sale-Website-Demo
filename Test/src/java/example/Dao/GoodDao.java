/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Good;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface GoodDao {
    public void saveGood(Good good);

    public void deleteGood(Good good);

    public void updateGood(Good good);

    public List search();
}
