package com.example.xyzhotel.servletz.auth;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "confirm user email", value = "/confirm")
public class confirmEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // http://localhost:8080/confirm?token=d136ba64-b258-471a-a01b-b8e645163663&tokeid=d136ba64-b258-471a-a01b-b8e645163663

        String token = req.getParameter("token");
        String tokenId = req.getParameter("tokeid");


    }
}
