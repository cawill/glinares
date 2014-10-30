/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utils;

import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author Josmarl
 */
public class NumeroFactura {


     public String customFormat(String pattern, double value ) {
      NumberFormat myFormatter = new DecimalFormat(pattern);
      String output = myFormatter.format(value);
      return output;
   }
         public static void main(String[]args){

             NumeroFactura nf=new NumeroFactura();
             System.out.println(nf.customFormat("000000", 432));
         }
         
         public NumeroFactura nf(){
        return new NumeroFactura();
    }

}
