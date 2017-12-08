/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Chef;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface ChefService {

    public void save(Chef chef);

    public void delete(Chef chef);

    public void update(Chef chef);

    public List search();
}
