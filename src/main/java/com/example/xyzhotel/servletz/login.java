package com.example.xyzhotel.servletz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@WebServlet(name = "Loginroute", value = "/login")
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("error", 0);
        req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String Password = req.getParameter("password");

        if(username != null | Password != null){ // checking for null values

            if(Objects.equals(username, "admin") && Objects.equals(Password, "admin")){

                // checking for Login
                PrintWriter out = resp.getWriter();
                out.println("<html> logged in  true <body>");
            }
            else{

                req.setAttribute("error", 2); // error 2 is username password wrong
                req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
            }

        }else{
            req.setAttribute("error", 1); // error 1 is for null username or password
           req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);


        }

    }
}
