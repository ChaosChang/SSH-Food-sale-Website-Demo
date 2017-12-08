/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Eimage;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface EimageDao {
    public void saveEimage(Eimage eimage);

    public void deleteEimage(Eimage eimage);

    public void updateEimage(Eimage eimage);

    public List search();
}
