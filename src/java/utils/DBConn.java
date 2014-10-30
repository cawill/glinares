/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.*;

/**
 *
 * @author Alumno
 */
public class DBConn {

    public Connection con = null;
    public PreparedStatement ps = null;
    public PreparedStatement psId = null;
    public ResultSet rs = null;
    public ResultSet rsId = null;
    public CallableStatement cs = null;
    public int i = 0;

    public void getConexionDb() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            if (con == null) {
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl", "root", "l1n4r3swcp");

                System.out.println("Conexion Open!");
            }
        } catch (Exception e) {
            System.out.println("Error de Conexion " + e.getMessage());
        }
    }

    public void getCerrarConexion() {
        try {
            if (rs != null) {
                rs.close();
                System.out.println("Conexion rs Close!");
            }
            if (rsId != null) {
                rsId.close();
                System.out.println("Conexion rsId Close!");
            }
            if (ps != null) {
                ps.close();
                System.out.println("Conexion ps Close!");
            }
            if (psId != null) {
                psId.close();
                System.out.println("Conexion psId Close!");
            }
            if (cs != null) {
                cs.close();
                System.out.println("Conexion cs Close!");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
