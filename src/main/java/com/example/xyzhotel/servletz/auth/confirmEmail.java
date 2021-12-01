package com.example.xyzhotel.servletz.auth;

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

        // http://localhost:8080/confirm?token=d136ba64-b258-471a-a01b-b8e645163663&tokeid=d136ba64-b258-471a-a01b-b8e645163663

        String token = req.getParameter("token");
        String tokenId = req.getParameter("tokeid");

        System.out.println("[+] Info : Token requested = "+token);
        System.out.println("[+] Info : Token id request = "+tokenId);

        validateToken vt = new validateToken();
        try {
            boolean isAlive = vt.isTokenAlive(tokenId, token);
            PrintWriter io = resp.getWriter();

            if(isAlive){
                io.println("token valid");
            }
            else{
                io.println("token invalid");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
