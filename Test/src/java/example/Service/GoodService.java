/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Good;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface GoodService {
    public void save(Good good);

    public void delete(Good good);

    public void update(Good good);

    public List search();
}
