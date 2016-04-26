
package servlets;

import clases.Conexion;
import clases.Usuario;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ServletBuscarPaciente", urlPatterns = {"/ServletBuscarPaciente"})
public class ServletBuscarPaciente extends HttpServlet {

    private Connection conexion;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletBuscarPaciente</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try{
                Conexion cnx = new Conexion("bdsgcd", "jdbc:mysql://localhost:3306/");
                conexion = cnx.getConexion();

                String usuario = request.getParameter("IdUsuario");
                PreparedStatement st = conexion.prepareStatement("SELECT * FROM vwUsuarios WHERE id_usu = ? AND id_rol = ?");
                st.setString(1, usuario);
                st.setString(2, "rol0000000003");
                ResultSet rs = st.executeQuery();
                
                RequestDispatcher rd;
                if(!rs.next()){
                    request.setAttribute("err", "El usuario no se encuentra registrado en el sistema");
                    rd = request.getRequestDispatcher("homeadmin.jsp");
                    rd.forward(request, response);
                } else {
                    Usuario _objUsuario = new Usuario();
                    _objUsuario.setNombre(rs.getString("nom_usu"));
                    _objUsuario.setApellidoPaterno(rs.getString("pat_usu"));
                    _objUsuario.setApellidoMaterno(rs.getString("mat_usu"));
                    _objUsuario.setId(usuario);
                    _objUsuario.setRolId(rs.getString("id_rol"));
                    _objUsuario.setRol(rs.getString("des_rol"));
                    _objUsuario.setDireccion(rs.getString("dir_usu"));
                    _objUsuario.setPuesto("des_esp");
                    _objUsuario.getId();
                    HttpSession sesion = request.getSession(true);    
                    sesion.setAttribute("paciente",_objUsuario );
                    rd = request.getRequestDispatcher("homeadmin.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ServletBuscarPaciente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
