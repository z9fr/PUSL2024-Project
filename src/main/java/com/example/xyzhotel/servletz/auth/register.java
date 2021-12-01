package com.example.xyzhotel.servletz.auth;

import com.example.xyzhotel.dao.auth.createUser.checkUserExist;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
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

        PrintWriter writer = resp.getWriter();
        writer.println("<html> <body>");

        String uname = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        checkUserExist checkuinfo = new checkUserExist();

        Boolean isValidmail = isValidEmailAddress(email);

        if(isValidmail){

            Boolean userExist = checkuinfo.checkUsername(uname);
            Boolean mailExist = checkuinfo.checkemailExist(email);

            if(userExist || mailExist){
                req.setAttribute("error", "The Username or Email Already Taken");
                req.getRequestDispatcher("/jsp/auth/signup.jsp").forward(req, resp);
            }

            else {
                writer.println("<code> valid user </code>");
            }

            // verify username

            // send the mail with the hash

            // add to the database saying not confirmed


        }
        else{
            req.setAttribute("error", "Please Enter a Valid Email");
            req.getRequestDispatcher("/jsp/auth/signup.jsp").forward(req, resp);
        }


    }

    public static boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = false;
        }
        return result;
    }
}
