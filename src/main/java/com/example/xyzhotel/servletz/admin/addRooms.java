package com.example.xyzhotel.servletz.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

//
@WebServlet(name = "add rooms", value = "/user/admin/add/room/")
public class addRooms extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session =req.getSession();
        String role = (String) session.getAttribute("role");

        PrintWriter out = resp.getWriter();

        if(Objects.equals(role, "admin"))
        {
            String title = (String) req.getParameter("title");
            String price = (String) req.getParameter("price");
            String room_img = (String) req.getParameter("room_image");
            String room_desc = (String) req.getParameter("room_description");

            // add stuff here

        }

    }
}
