package com.example.xyzhotel.servletz.auth;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "sign up" , value = "/signup")
public class register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/auth/signup.jsp");
        requestDispatcher.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uname = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        PrintWriter io = resp.getWriter();
        io.println("<html> <body>");
        io.println("[+] Username = " + uname +"<br>");
        io.println("[+] email = " + email);

        // verify username

        // make email with hash

        // send email

        // confirm email

        //


    }
}
