
package clases;

import java.sql.*;


public class Conexion {
   private String bd;
   private String usuario;
   private String pass;
   private String url;
   private Connection conexion;
   
   public Conexion(){
       
   }
   
   public Conexion(String BaseDatos,String User, String Password, String DbUrl){
       this.bd=BaseDatos;
       this.usuario=User;
       this.pass=Password;
       this.url=DbUrl;
   }
   
   public Conexion(String BaseDatos, String DbUrl){
       this.bd=BaseDatos;
       this.usuario="root";
       this.pass="n0m3l0s3";
       this.url=DbUrl;
   }
   
   public String getBd(){
       return this.bd;
   }   
   public void setBd(String BaseDatos){
       this.bd=BaseDatos;
   }
   
   public String getUsuario(){
       return this.usuario;
   }
   public void setUsuario(String User){
       this.usuario=User;
   }
   
   public String getPassword(){
       return this.pass;
   }
   public void setPassword(String Password){
       this.pass=Password;
   }
   
   public String getUrl(){
       return this.url;
   }
   public void setUrl(String DbUrl){
       this.url=DbUrl;
   }
   
   public Connection getConexion(){
       try{
           Class.forName("com.mysql.jdbc.Driver");
           conexion = DriverManager.getConnection(url + bd,usuario,pass);
           
       } catch (ClassNotFoundException ex) {
           System.out.println("Error en Clase por Nombre: "+ ex.getMessage());
       } catch (SQLException ex) {
           System.out.println("Excepción SQL: "+ ex.getMessage());
       }
       return conexion;
   }
}
