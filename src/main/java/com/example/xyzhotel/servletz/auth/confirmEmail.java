package com.example.xyzhotel.servletz.auth;

import com.example.xyzhotel.dao.auth.ConfirmToken.KilltheToken;
import com.example.xyzhotel.dao.auth.ConfirmToken.UpdateUserVerification;
import com.example.xyzhotel.dao.auth.ConfirmToken.getUserRequestedToken;
import com.example.xyzhotel.dao.auth.ConfirmToken.validateToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "confirm user email", value = "/confirm")
public class confirmEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // http://localhost:8080/confirm?token=d136ba64-b258-471a-a01b-b8e645163663&tokeid=f41f6bae-c5f4-4e92-a534-c4e49c7a704a


        String token = req.getParameter("token");
        String tokenId = req.getParameter("tokeid");

        System.out.println("[+] Info : Token requested = "+token);
        System.out.println("[+] Info : Token id request = "+tokenId);

        validateToken vt = new validateToken();
        getUserRequestedToken reqtoken = new getUserRequestedToken();
        UpdateUserVerification updateUserVerification = new UpdateUserVerification();
        KilltheToken killtoken = new KilltheToken();

        try {
            boolean isAlive = vt.isTokenAlive(tokenId, token);
            PrintWriter io = resp.getWriter();

            if(isAlive){
                // check the user own the token
                String tokenOwner = reqtoken.getUser(tokenId);

                // make user valid

                boolean userUpdated = updateUserVerification.updateVerification(tokenOwner, tokenId);

                if(userUpdated){
                    // kill the token
                    boolean isDead = killtoken.killtoken(tokenId, token);

                    if(isDead){
                        // all good token dead and user validated
                        // emailVerification
                        req.getRequestDispatcher("/jsp/emailVerification/confirmed.jsp").forward(req, resp);
                    }
                    else{
                        // confirm_error_detail_log
                        // confirmed.jsp
                        req.setAttribute("confirm_error_detail_log", "while creating the account we were not able to kill your session, something went wrong our side please contact a admin");
                        req.getRequestDispatcher("/jsp/emailVerification/failedtoVerify.jsp").forward(req, resp);
                    }

                }
            }
            else{
                req.setAttribute("confirm_error_detail_log","The token you submitted was invalid please check your token again");
                req.getRequestDispatcher("/jsp/emailVerification/failedtoVerify.jsp").forward(req, resp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("confirm_error_detail_log",e);
            req.getRequestDispatcher("/jsp/emailVerification/failedtoVerify.jsp").forward(req, resp);
        }

    }
}
