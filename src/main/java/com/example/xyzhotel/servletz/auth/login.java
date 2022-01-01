package com.example.xyzhotel.servletz.auth;

import com.example.xyzhotel.dao.auth.authUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Loginroute", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //dispatch the request to login.jsp resource
        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/auth/login.jsp");
        dispatcher.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get the username from the login form
        HashPassword hp = new HashPassword();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String hashedPassword = hp.getHash(password);

        System.out.println(hashedPassword);

        //call DAO for validation logic
        authUser dao= new authUser();
        boolean isValidUser = dao.validateUser(username, hashedPassword);

        if(isValidUser){

            String role = dao.getUserRole(username, hashedPassword);
            String email = dao.getUserMail(username );
            int uuid = dao.getUserID(username, hashedPassword);


            if(uuid == 0){
                req.setAttribute("error", "Internal Server Error");
                req.getRequestDispatcher("/jsp/auth/login.jsp").forward(req, resp);
            }

            else{
                HttpSession session = req.getSession();

                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("password", password);
                session.setAttribute("user_id", uuid);
                session.setAttribute("user_email", email);
                

                System.out.println("[+] "+uuid+" "+username+" "+role+" Logged in");

                resp.sendRedirect("/user/panel?msg=LoginSuccess");
            }
        }
        else{
            String errorMessage="Invalid Credentials, please login again!";
            req.setAttribute("error", errorMessage);
            req.getRequestDispatcher("/jsp/auth/login.jsp").forward(req, resp);


        }

    }
}
