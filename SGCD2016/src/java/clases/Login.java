
package clases;

import java.sql.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Login {
    private String _usuario;
    private String _Password;
    private Usuario _objUsuario;
    private Connection conexion;
    
    public Login(){
        
    }
    public Login(String Usuario, String Password){
        this._usuario=Usuario;
        this._Password=Password;
    }
    
    public int ValidaLogin(){
        try{
            Conexion cn = new Conexion("bdsgcd","jdbc:mysql://localhost:3306/");
            conexion = cn.getConexion();
            if(conexion == null){
                return -5;
            }
            PreparedStatement st = conexion.prepareStatement("SELECT * FROM vwLogin WHERE id_usu = ?");
            st.setString(1, _usuario);
            ResultSet rs = st.executeQuery();
            
            if(!rs.next()){
                return 0;
            } else {
                do {
                    if (rs.getString("pas_usu").equals(EncriptaCadena(_Password))){
                        _objUsuario = new Usuario();
                        _objUsuario.setNombre(rs.getString("nom_usu"));
                        _objUsuario.setApellidoPaterno(rs.getString("pat_usu"));
                        _objUsuario.setApellidoMaterno(rs.getString("mat_usu"));
                        _objUsuario.setId(_usuario);
                        _objUsuario.setRolId(rs.getString("id_rol"));
                        _objUsuario.setRol(rs.getString("des_rol"));
                        return 1;
                    } else {
                        return -1;
                    }
                } while(rs.next());
            }
        } catch (SQLException ex) { 
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -99;
    }
    
    public Usuario getUsuario(){
        return _objUsuario;
    }
    
    private String EncriptaCadena(String cad){
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] cadBytes = cad.getBytes();
            md.reset();
            byte[] encBytes = md.digest(cadBytes);
            
            StringBuffer sb = new StringBuffer();
            for(int i = 0;i<encBytes.length;i++){
                sb.append(Integer.toHexString(0xff & encBytes[i]));
            }
            
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
