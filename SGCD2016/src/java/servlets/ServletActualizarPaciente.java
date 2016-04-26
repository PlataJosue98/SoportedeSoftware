
package servlets;

import clases.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ServletActualizarPaciente", urlPatterns = {"/ServletActualizarPaciente"})
public class ServletActualizarPaciente extends HttpServlet {

    private Connection conexion;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletActualizarPaciente</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try{
                Conexion cnx = new Conexion("bdsgcd", "jdbc:mysql://localhost:3306/");
                conexion = cnx.getConexion();
                RequestDispatcher rd;
                
                if("Actualizar".equals(request.getParameter("btn_actualiza"))){
                    PreparedStatement st = conexion.prepareStatement("UPDATE Musuario SET nom_usu = ?, pat_usu= ?, mat_usu = ?, dir_usu = ? WHERE id_usu = ?");
                    st.setString(1, request.getParameter("nombreUsuario"));
                    st.setString(2, request.getParameter("aPatUsuario"));
                    st.setString(3, request.getParameter("aMatUsuario"));
                    st.setString(4, request.getParameter("dirUsuario"));
                    st.setString(5, request.getParameter("idUsuario"));
                    st.executeUpdate();
                    request.getSession().removeAttribute("paciente");
                    request.setAttribute("msg", "Información de paciente actualizada");
                    rd = request.getRequestDispatcher("homeadmin.jsp");
                    rd.forward(request, response);
                }
                else if("Eliminar".equals(request.getParameter("btn_elimina"))){
                    PreparedStatement st = conexion.prepareStatement("DELETE FROM Musuario WHERE id_usu = ?");
                    st.setString(1, request.getParameter("idUsuario"));
                    st.executeUpdate();
                    request.getSession().removeAttribute("paciente");
                    request.setAttribute("msg", "Paciente eliminado");
                    rd = request.getRequestDispatcher("homeadmin.jsp");
                    rd.forward(request, response);
                }
            }
            catch (SQLException ex) {
                Logger.getLogger(ServletActualizarPaciente.class.getName()).log(Level.SEVERE, null, ex);
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
