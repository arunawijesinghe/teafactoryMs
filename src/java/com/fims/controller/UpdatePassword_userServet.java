/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.model.User;
import com.fims.utillity.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aruna Csw
 */
public class UpdatePassword_userServet extends HttpServlet {

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
        
        PrintWriter out =response.getWriter();
        
        User user = new User();
        String username=request.getParameter("uname");
        String password=request.getParameter("c_pword");
        String newPassword = request.getParameter("nw_pword");
        String confirm_pword=request.getParameter("rnw_pword");
        
        HttpSession session;
        session =request.getSession();
        user = (User) session.getAttribute("user");
        
        if(username.equals(user.getUsername()) && password.equals(user.getPassword())){
            if(newPassword.equals(confirm_pword)){

            try {
                Connection con=DatabaseConnection.getConnection();
                
                
                
                PreparedStatement pst = con.prepareStatement("UPDATE user SET password ='"+confirm_pword+"' where username='"+username+"'");
                pst.executeUpdate();
                 out.print("<head><title>Success</title>"
                    + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                    + "</head>"
                    + "<Body><div class=\"row\">"
                    + "<div class=\"well\" style=\"background:#\">"
                    + "<font color=\"Green\">"
                    + "<h1 align=\"center\">Password Updated Successfully !</h1>"
                    + "<p align=\"center\"> &nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<a href=\"profile_user.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                    + "</p> <hr/>\n<font color=\"black\">"
                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                    + " </div>");
            } catch (SQLException ex) {
                Logger.getLogger(UpdatePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                 out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Data Inserted Failed !</h1>"
                        + "<p align=\"center\">Please Check you inserted values<br> OR<br>"
                        + "All Field Must Be Filled<br>"
                        + "<a href=\"myProfile_user.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            }}else{
            
             out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Password Confirmation Failed !</h1>"
                        + "<a href=\"myProfile_user.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            
            
            }
            
            
       
            
        }else{
                        out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Password Update Failed !</h1>"
                        + "<p align=\"center\">Please Check you inserted values<br> OR<br>"
                        + "All Field Must Be Filled<br>"
                        + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            }

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
