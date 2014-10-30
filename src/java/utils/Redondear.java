package utils;


import java.math.*;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Josmarl
 */
public class Redondear {
    public Double Redondear(Double num,int numDecimales){
    BigDecimal decimal=new BigDecimal(num);
    double newNum =decimal.setScale(numDecimales, decimal.ROUND_HALF_UP).doubleValue();
    return newNum;
    }
      public static void main(String[]args){
          Redondear r=new Redondear();
      System.out.println(r.Redondear(123.4323,2));
      }
      
      public Redondear red() {
        return new Redondear();
    }
}
