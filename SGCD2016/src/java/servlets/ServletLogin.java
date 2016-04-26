
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clases.Login;

import javax.servlet.RequestDispatcher;


@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            
            Login lg = new Login(request.getParameter("usuario"), request.getParameter("password"));
            int res = lg.ValidaLogin();
            RequestDispatcher rd;
            switch (res){
                case 0:
                    request.setAttribute("msg", "El usuario no se encuentra registrado en el sistema");
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                case -1:
                    request.setAttribute("msg", "Contraseña incorrecta");
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                case 1:
                    HttpSession sesion = request.getSession(true);    
                    sesion.setAttribute("usuario",lg.getUsuario() );
                    sesion.removeAttribute("paciente");
                    sesion.removeAttribute("medico");
                    rd = request.getRequestDispatcher("homeadmin.jsp");
                    rd.forward(request, response);
                case -5:
                    request.setAttribute("msg", "No fue posible conectarse a la base de datos.");
                    rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
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
