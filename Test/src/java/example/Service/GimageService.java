/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Gimage;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface GimageService {

    public void save(Gimage gimage);

    public void delete(Gimage gimage);

    public void update(Gimage gimage);

    public List search();
}
