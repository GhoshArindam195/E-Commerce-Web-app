
package com.learn.mycart.servlet;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.HomeHandle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String loginEmail=request.getParameter("loginEmail");
            String loginPwd=request.getParameter("loginPwd");
            
            UserDao ud = new UserDao(FactoryProvider.getFactory());
            
            User user = ud.getUserByEmailandPassword(loginEmail, loginPwd);
            
            HttpSession httpSession = request.getSession();
            
            if(user==null)
            {
                httpSession.setAttribute("message", "Invalid email or password ! Try again...");
                response.sendRedirect("login.jsp");
            }
            else
            {
                httpSession.setAttribute("message", "Welcome"+user.getUserName());
                httpSession.setAttribute("current_user", user);
                if(user.getUserType().equals("buyer"))
                    response.sendRedirect("home.jsp");
                else if(user.getUserType().equals("seller"))
                    response.sendRedirect("sellerHome.jsp");
                else
                    response.sendRedirect("adminHome.jsp");
            }
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
