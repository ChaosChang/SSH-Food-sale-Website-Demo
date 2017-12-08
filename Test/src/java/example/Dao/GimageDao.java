/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Gimage;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface GimageDao {
    public void saveGimage(Gimage gimage);

    public void deleteGimage(Gimage gimage);

    public void updateGimage(Gimage gimage);

    public List search();
}
