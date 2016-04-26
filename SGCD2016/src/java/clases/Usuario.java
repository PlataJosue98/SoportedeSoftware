
package clases;


public class Usuario {
    private String _nombre;
    private String _aPaterno;
    private String _aMaterno;
    private String _id;
    private String _rolId;
    private String _rolDes;
    private String _direccion;
    private String _puesto;
    
    public Usuario(){
        
    }
    
    public String getNombre(){
        return this._nombre;
    }
    public void setNombre(String nombre){
        this._nombre = nombre;
    }
    
    public String getApellidoPaterno(){
        return this._aPaterno;
    }
    public void setApellidoPaterno(String apellidoPaterno){
        this._aPaterno = apellidoPaterno;
    }
    
    public String getApellidoMaterno(){
        return this._aMaterno;
    }
    public void setApellidoMaterno(String apellidoMaterno){
        this._aMaterno = apellidoMaterno;
    }
    
    public String getId(){
        return this._id;
    }
    public void setId(String id){
        this._id = id;
    }
    
    public String getRolId(){
        return this._rolId;
    }
    public void setRolId(String rolId){
        this._rolId = rolId;
    }
    
    public String getRol(){
        return this._rolDes;
    }
    public void setRol(String rol){
        this._rolDes = rol;
    }
    
    public String getDireccion(){
        return this._direccion;
    }
    public void setDireccion(String direccion){
        this._direccion = direccion;
    }
    
    public String getPuesto(){
        return this._puesto;
    }
    public void setPuesto(String puesto){
        this._puesto = puesto;
    }
    
    public String getNombreCompleto(){
        return this._nombre + ' ' + this._aPaterno + ' ' + this._aMaterno;
    }
}
