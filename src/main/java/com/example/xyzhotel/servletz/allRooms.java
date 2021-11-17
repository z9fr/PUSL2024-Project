package com.example.xyzhotel.servletz;

import com.example.xyzhotel.beans.room;
import com.example.xyzhotel.dao.ApplicationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "allRooms", value = "/all")
public class allRooms extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ApplicationDao dao = new ApplicationDao();
        List<room> rooms = dao.getAllRooms();

        req.setAttribute("rooms", rooms);
        req.getRequestDispatcher("/jsp/rooms.jsp").forward(req, resp);


    }
}
