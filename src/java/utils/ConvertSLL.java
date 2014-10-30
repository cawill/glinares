package utils;

/* @(#)ConvertSLL.java 1.0 04/04/26 - Submit Consulting - Lima, Per�
 * Copyright (c) 2004 - Angel SULLON M., All Right Reserved.
 * Este software se proporciona sin garant�as de ning�n tipo de su 
 * funcionamiento y en ning�n caso ser� el autor responsable de da�os 
 * o perjuicios que deriven del mal uso o alteraci�n del programa.
 * *********************************************************************
 * El siguiente componente convierte un valor real a palabras
 * 
 */
import  java.sql.*;
import  java.util.*;
import  java.text.*;
import  java.io.*;
import  java.lang.*;

public class ConvertSLL {

	String union;
    Locale local;//Locale[] locales={new Locale("en","US"),new Locale("de","DE"),new Locale("fr","FR") };
	
	public ConvertSLL(){// por defecto
		union="y";
		local=new Locale("en","US");
	}
	
	public void setUnion(String union){
		this.union=union;
	}
	public String getUnion(){
		return union;
	}
	
	public void setLocal(Locale local){
		this.local=local;
	}
	public Locale getLocal(){
		return local;
	}

	public double sRound( double nro, int decimales ) {
		String patron="";
		for(int i=0;i<decimales;i++) patron+="0";
  		return Double.valueOf( numberFormat("######."+patron, nro ) ).doubleValue();
	}
	public double sRound( double nro ) {
		return sRound( nro, 0 ) ;
	}
	
	public double hacerDouble( String nro ) {
		return Double.valueOf( nro ).doubleValue();
	}
	
	public int hacerInt( String nro ) {
		return Integer.valueOf( nro ).intValue();
	}

	public  String numberFormat(String pattern, double value ) {
      	 DecimalFormat df = (DecimalFormat)NumberFormat.getNumberInstance(local);
      	df.applyPattern(pattern);
      	return df.format(value);
	}
	public String numberFormat( double nro ) {
    	return numberFormat("###,###.00", nro);
	}

/********* codigo para convertir numero(m�x 12 d�gitos) a letras ******************/
	public String sNro_Palabras(double nro) {
		return sNro_Palabras( ""+nro);
	}
	public String sNro_Palabras(String nro) {
		if( ((int)Double.valueOf( nro ).doubleValue()+"").length()<=6){
			return sullNro_Palabras( ""+nro);
		}else{
			return 	"Para habiliar la conversi�n de n�meros de hasta 15 d�gitos cont�ctese al\n "+
					"Cel: 051951751496 - E_Mail: angeli@upeu.edu.pe / asullom@hotmail.com, invocar a getCopyright()";
		}
	}
	
public String sullNro_Palabras(double nro) {
	return sullNro_Palabras( nro+"");
}
public String sullNro_Palabras(String nro) {
	Locale tempLocal=getLocal();
	local=new Locale("en","US");
	nro=numberFormat("######.00", Double.valueOf( nro ).doubleValue() );
	local=tempLocal;
	String snro=nro+"";
	String snro_pd="";
	String snro_pe="";
	String snro_palabra="";
    int posPunto=snro.lastIndexOf(".");
//	String _=" ";
	
	String u="";
	String d="";
	String c="";
	
	String um="";
	String dm="";
	String cm="";
	
	String uM="";
	String dM="";
	String cM="";

	String uB="";
	String dB="";
	String cB="";

	snro_pd = snro.substring(posPunto+1,snro.length());//parte decimal
	snro_pe = snro.substring(0,posPunto);//parte entera
	if(snro_pe.length()<=8){
		if(snro_pe.length()>=1){
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("1") ) u="uno";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("2") ) u="dos";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("3") ) u="tres";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("4") ) u="cuatro";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("5") ) u="cinco";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("6") ) u="seis";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("7") ) u="siete";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("8") ) u="ocho";
			if( snro_pe.substring(snro_pe.length()-1,snro_pe.length()).equals("9") ) u="nueve";
			snro_palabra=u;
		}
		if(snro_pe.length()>=2){
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("0") ) d=" "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("1") ) d="dieci"+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("2") ) d="veinti"+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("3") ) d="treinta y "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("4") ) d="cuarenta y "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("5") ) d="cincuenta y "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("6") ) d="sesenta y "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("7") ) d="setenta y "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("8") ) d="ochenta y "+u;
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()-1).equals("9") ) d="noventa y "+u;

			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("10") ) d="diez";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("11") ) d="once";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("12") ) d="doce";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("13") ) d="trece";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("14") ) d="catorce";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("15") ) d="quince";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("20") ) d="veinte";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("30") ) d="treinta";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("40") ) d="cuarenta";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("50") ) d="cincuenta";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("60") ) d="sesenta";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("70") ) d="setenta";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("80") ) d="ochenta";
			if( snro_pe.substring(snro_pe.length()-2,snro_pe.length()).equals("90") ) d="noventa";
			snro_palabra=d;
		}
		if(snro_pe.length()>=3){
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("0") ) c=" "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("1") ) c="ciento "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("2") ) c="doscientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("3") ) c="trescientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("4") ) c="cuatrocientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("5") ) c="quinientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("6") ) c="seiscientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("7") ) c="setecientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("8") ) c="ochocientos "+d;
			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()-2).equals("9") ) c="novecientos "+d;

			if( snro_pe.substring(snro_pe.length()-3,snro_pe.length()).equals("100") ) c="cien";
			snro_palabra=c;
		}
		if(snro_pe.length()>=4){
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("0") ) um=" "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("1") ){ um="mil "+c; if(snro_pe.length()>=5) um="un mil "+c;}
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("2") ) um="dos mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("3") ) um="tres mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("4") ) um="cuatro mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("5") ) um="cinco mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("6") ) um="seis mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("7") ) um="siete mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("8") ) um="ocho mil "+c;
			if( snro_pe.substring(snro_pe.length()-4,snro_pe.length()-3).equals("9") ) um="nueve mil "+c;
			snro_palabra=um;
		}
		if(snro_pe.length()>=5){
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("0") ) dm=" "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("2") ) dm="veinti"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("3") ) dm="treinta y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("4") ) dm="cuarenta y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("5") ) dm="cincuenta y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("6") ) dm="sesenta y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("7") ) dm="setenta y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("8") ) dm="ochenta y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("9") ) dm="noventa y "+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-4).equals("1") ) dm="dieci"+um;

			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("10") ) dm="diez mil "+c;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("11") ) dm="once mil "+c;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("12") ) dm="doce mil "+c;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("13") ) dm="trece mil "+c;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("14") ) dm="catorce mil "+c;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("15") ) dm="quince mil "+c;

			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("20") ) dm="veinte mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("30") ) dm="treinta mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("40") ) dm="cuarenta mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("50") ) dm="cincuenta mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("60") ) dm="sesenta mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("70") ) dm="setenta mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("80") ) dm="ochenta mil"+um;
			if( snro_pe.substring(snro_pe.length()-5,snro_pe.length()-3).equals("90") ) dm="noventa mil"+um;
			snro_palabra=dm;
		}
		if(snro_pe.length()>=6){
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("0") ) cm=" "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("1") ) cm="ciento "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("2") ) cm="doscientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("3") ) cm="trescientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("4") ) cm="cuatrocientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("5") ) cm="quinientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("6") ) cm="seiscientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("7") ) cm="setecientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("8") ) cm="ochocientos "+dm;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-5).equals("9") ) cm="novecientos "+dm;

			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("100") ) cm="cien mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("200") ) cm="doscientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("300") ) cm="trescientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("400") ) cm="cuatrocientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("500") ) cm="quinientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("600") ) cm="seiscientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("700") ) cm="setecientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("800") ) cm="ochocientos mil "+c;
			if( snro_pe.substring(snro_pe.length()-6,snro_pe.length()-3).equals("900") ) cm="novecientos mil "+c;
			snro_palabra=cm;
		}
		if(snro_pe.length()>=7){
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("0") ) uM=" "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("1") ){ uM="un millon "+cm; if(snro_pe.length()>=8) uM="un millones "+cm;}
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("2") ) uM="dos millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("3") ) uM="tres millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("4") ) uM="cuatro millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("5") ) uM="cinco millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("6") ) uM="seis millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("7") ) uM="siete millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("8") ) uM="ocho millones "+cm;
			if( snro_pe.substring(snro_pe.length()-7,snro_pe.length()-6).equals("9") ) uM="nueve millones "+cm;
			snro_palabra=uM;
		}
		if(snro_pe.length()>=8){
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("0") ) dM=" "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("2") ) dM="veinti"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("3") ) dM="treinta y "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("4") ) dM="cuarenta y "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("5") ) dM="cincuenta y "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("6") ) dM="sesenta y "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("7") ) dM="setenta y "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("8") ) dM="ochenta y "+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("9") ) dM="noventa y "+uM;

			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-7).equals("1") ) dM="dieci"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("10") ) dM="diez millones "+cm;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("11") ) dM="once millones "+cm;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("12") ) dM="doce millones "+cm;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("13") ) dM="trece millones "+cm;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("14") ) dM="catorce millones "+cm;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("15") ) dM="quince millones "+cm;

			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("20") ) dM="veinte millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("30") ) dM="treinta millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("40") ) dM="cuarenta millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("50") ) dM="cincuenta millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("60") ) dM="sesenta millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("70") ) dM="setenta millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("80") ) dM="ochenta millones"+uM;
			if( snro_pe.substring(snro_pe.length()-8,snro_pe.length()-6).equals("90") ) dM="noventa millones"+uM;
			snro_palabra=dM;
		}
				
		return snro_palabra+" "+union+" "+snro_pd+"/100";
	}else{ //si snro_pe.length()>12 imprimir snro_pe 
		return numberFormat("###,###", Double.valueOf(snro_pe).doubleValue())+" "+union+" "+snro_pd+"/100 contactese a asullom@hotmail.com";
	}
	}
	public String getCopyright(){
		return "Copyright (c) 2004 Lima Per� - Angel SULLON MACALUP�, All Right Reserved. Cel:01-96432394 - E_Mail:angeli@upeu.edu.pe/asullom@hotmail.com";
	}
    public ConvertSLL csll(){
    return new ConvertSLL();
    }
/******* fin codigo para convertir numero a palabras ******************/




public String dia(String nro) {
  String mes="";
  if( nro.equals("")) return "";
  if(Integer.parseInt(nro)>=1 && Integer.parseInt(nro)<=7){
	 if(Integer.parseInt(nro)== 1)mes="Domingo";
	 if(Integer.parseInt(nro)== 2)mes="Lunes";
	 if(Integer.parseInt(nro)== 3)mes="Martes";
	 if(Integer.parseInt(nro)== 4)mes="Mi�rcoles";
	 if(Integer.parseInt(nro)== 5)mes="Jueves";
	 if(Integer.parseInt(nro)== 6)mes="Viernes";
	 if(Integer.parseInt(nro)== 7)mes="S�bado";
	 return mes;
  }else{
	return "D�a no v�lido";
 }
}


public String mes(String nro) {
  String mes="";
  //if( nro.equals("") ) nro="0";
  if( nro.equals("")) return "";
  if(Integer.parseInt(nro)>=1 && Integer.parseInt(nro)<=12){
	 if(Integer.parseInt(nro)== 1)mes="Enero";
	 if(Integer.parseInt(nro)== 2)mes="Febrero";
	 if(Integer.parseInt(nro)== 3)mes="Marzo";
	 if(Integer.parseInt(nro)== 4)mes="Abril";
	 if(Integer.parseInt(nro)== 5)mes="Mayo";
	 if(Integer.parseInt(nro)== 6)mes="Junio";
	 if(Integer.parseInt(nro)== 7)mes="Julio";
	 if(Integer.parseInt(nro)== 8)mes="Agosto";
	 if(Integer.parseInt(nro)== 9)mes="Setiembre";
	 if(Integer.parseInt(nro)==10)mes="Octubre";
	 if(Integer.parseInt(nro)==11)mes="Noviembre";
	 if(Integer.parseInt(nro)==12)mes="Diciembre";
	 return mes;
  }else{
	return "Mes no v�lido";
 }
}
public String getDate(String pattern) {
  java.util.Date fechaTemp =new java.util.Date();
  SimpleDateFormat formato_fecha=new SimpleDateFormat(pattern);
  String fecha_formateada=formato_fecha.format(fechaTemp);
  return fecha_formateada;
}



/*********************/
/****** para conpaginar de BD*******/
public boolean sAbsolute(java.sql.ResultSet rs, int row) throws java.sql.SQLException {
    boolean result = false;
    for(int x=1;x<row;x++) { result = !rs.next(); }
    return result;
}
/****** end para conpaginar *******/

/****** para conpaginar de un ArrayList*******/
public boolean sAbsolute2(java.util.Iterator it, int row) throws java.sql.SQLException {
	boolean result = false;
    for(int x=1;x<row;x++) {
    	 result = !it.hasNext();
    	 it.next();  	//System.out.println("x="+x+"  "+it.next());
    	 }
    return result;
}
/****** end para conpaginar *******/

public static void main(String[] args ){
	ConvertSLL fun=new ConvertSLL();
	System.out.println(""+ fun.sNro_Palabras("15989") );
	System.out.println(""+ fun.numberFormat("##,###.00",1598.288998766) );
	double couta= fun.sRound( ( 1598.2 )/5, 2);
	System.out.println(""+ couta );
}

}