/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utils;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Josmarl
 */
public class FechaTimestamp {
    public Timestamp fecha()
    {
        Date dates = new Date();
        long fechaSis = dates.getTime();
        Timestamp fecha = new Timestamp(fechaSis);
        return fecha;
    }   
}
