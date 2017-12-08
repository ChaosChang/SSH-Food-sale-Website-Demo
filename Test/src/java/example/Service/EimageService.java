/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Eimage;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface EimageService {
    public void save(Eimage eimage);

    public void delete(Eimage eimage);

    public void update(Eimage eimage);

    public List search();
}
