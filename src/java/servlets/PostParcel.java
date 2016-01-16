package servlets;

import beans.Parcel;
import model.Database;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ultmate
 */
public class PostParcel extends HttpServlet {

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
        HttpSession session = request.getSession();
        if(session.getAttribute("userid") != null) {
//            System.out.println("\nHere man**********************");
            String sender = request.getParameter("sender");
            String mobile1 = request.getParameter("senderMobile");
            Long senderMobile=0L, recMobile=0L;
            if(mobile1.length()!=0) {
                senderMobile = Long.parseLong(mobile1);
            }
            String receiver = request.getParameter("receiver");
            String mobile2 = request.getParameter("recMobile");
            if(mobile2.length() != 0) {
                recMobile = Long.parseLong(mobile2);
            }
            String description = request.getParameter("description");
            Parcel parcel = new Parcel(sender, senderMobile, receiver, recMobile, description);
            try{
                Database.postParcel(parcel);
                response.sendRedirect("postingSuccessful.jsp");
            } catch (SQLException sqlExc) {
                response.sendRedirect("errorPage.jsp");
                sqlExc.printStackTrace();
            }   
        } else {
            response.sendRedirect("index.jsp");
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
