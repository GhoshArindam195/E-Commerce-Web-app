package com.learn.mycart.servlet;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import com.learn.mycart.helper.SaveFile;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Arindam-PC
 */
@MultipartConfig
@WebServlet(name = "productOperationServlet", urlPatterns = {"/productOperationServlet"})
public class ProductOperationServlet extends HttpServlet {

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

            HttpSession session = request.getSession();
            String operation = request.getParameter("operation");
            if (operation.equals("addCat")) {
                //Add Category...
                String CatTitle = request.getParameter("cTitle");
                String CatDesc = request.getParameter("cDesc");

                Category category = new Category();
                category.setCategoryTitile(CatTitle);
                category.setCategoryDescription(CatDesc);

                //saving to the DB
                CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                if (cd.saveCategory(category)) {
                    session.setAttribute("message", "Category added successfully");
                    response.sendRedirect("adminHome.jsp");
                } else {
                    session.setAttribute("message", "Failed to add Category, try again...");
                    response.sendRedirect("adminHome.jsp");
                }
            } else if (operation.equals("addProd")) {
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDisc = Integer.parseInt(request.getParameter("pDisc"));
                int pQuant = Integer.parseInt(request.getParameter("pQuant"));
                int pCatId = Integer.parseInt(request.getParameter("pCatId"));
                Part part = request.getPart("pPic");

                Product product = new Product();
                product.setpName(pName);
                product.setpDesc(pDesc);
                product.setpPrice(pPrice);
                product.setpDiscount(pDisc);
                product.setpQuantity(pQuant);
                product.setpPhoto(part.getSubmittedFileName());

                CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                product.setCategory(cd.getCategoryByCategoryId(pCatId));

                ProductDao pd = new ProductDao(FactoryProvider.getFactory());

                if (pd.saveProduct(product)) 
                {
                    String path = request.getRealPath("img") + File.separator + "products\\"+part.getSubmittedFileName();
//                    System.out.println(path);
                    if(SaveFile.saveFile(part.getInputStream(), path))
                    {
                        session.setAttribute("message", "Your Product is Saved Successfully");
                        response.sendRedirect("adminHome.jsp");
                    }
                    else
                    {
                        session.setAttribute("message", "Fail to Save product image, try again..");
                        response.sendRedirect("adminHome.jsp");
                    }
                } 
                else 
                {
                    session.setAttribute("message", "Failed to save Product, try again...");
                    response.sendRedirect("adminHome.jsp");
                }
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
