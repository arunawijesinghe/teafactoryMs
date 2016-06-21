/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.utillity.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aruna Csw
 */
public class CustomerManagementServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        String colid = request.getParameter("sysid");
        String fullName = request.getParameter("fullName");
        String namewithinit = request.getParameter("nwi");
        String homeno = request.getParameter("homeno");
        String street = request.getParameter("street");
        String city1 = request.getParameter("city1");
        String city2 = request.getParameter("city2");
        String resPhone = request.getParameter("resphone");
        String mobPhone = request.getParameter("mobphone");
        if (null != action) {
            switch (action) {
                case "update":
                    Statement stm;
                    String Sql = "UPDATE `registration` SET `fullname`='"+fullName+"',`name_with_initials`='"+namewithinit+"', "
                            + " `home_no_name`='"+homeno+"', `street`='"+street+"',`city1`='"+city1+"', `city2`='"+city2+"',"
                            + "`residency_phone`='"+resPhone+"', `mobile_phone`='"+mobPhone+"'   WHERE `system_id`='" + colid + "'";
                    try {
                        stm = DatabaseConnection.getConnection().createStatement();
                        stm.executeUpdate(Sql);
                        out.print("<head><title>Success</title>"
                    + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                    + "</head>"
                    + "<Body><div class=\"row\">"
                    + "<div class=\"well\" style=\"background:#\">"
                    + "<font color=\"Green\">"
                    + "<h1 align=\"center\">Data Updated Successfully !</h1>"
                    + "<p align=\"center\"> &nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                    + "</p> <hr/>\n<font color=\"black\">"
                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                    + " </div>");
                      //  out.print(ap_id);

                    } catch (SQLException ex) {
                        Logger.getLogger(ApproveDailyJobServlet.class.getName()).log(Level.SEVERE, null, ex);
                         out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Data Update Failed !</h1>"
                        + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
                    }

                    break;
                case "delete":
                    Statement stm1;
                    String Sql1 = "DELETE FROM registration  WHERE `system_id`='" + colid + "'";
                    try {
                        stm1 = DatabaseConnection.getConnection().createStatement();
                        stm1.executeUpdate(Sql1);
out.print("<head><title>Success</title>"
                    + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                    + "</head>"
                    + "<Body><div class=\"row\">"
                    + "<div class=\"well\" style=\"background:#\">"
                    + "<font color=\"Green\">"
                    + "<h1 align=\"center\">"+colid+" Customer Deleted Successfully !</h1>"
                    + "<p align=\"center\"> &nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                    + "</p> <hr/>\n<font color=\"black\">"
                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                    + " </div>");                      //  out.print(ap_id);

                    } catch (SQLException ex) {
                        Logger.getLogger(ApproveDailyJobServlet.class.getName()).log(Level.SEVERE, null, ex);
                         out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Data Delete Failed !</h1>"
                        + "<p align=\"center\">"
                        + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
                    }
                    break;
            }
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
