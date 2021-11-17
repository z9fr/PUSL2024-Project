package com.example.xyzhotel.servletz;

import com.example.xyzhotel.beans.room;
import com.example.xyzhotel.dao.ApplicationDao;
import com.example.xyzhotel.dao.homeInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "webroot", value = "/home")
public class home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // last four ratings

        // need the last three rooms

        homeInfo dao = new homeInfo();
        List<room> rooms = dao.getAllRooms();

        req.setAttribute("latestRooms", rooms);
        req.getRequestDispatcher("/jsp/thehomepage.jsp").forward(req, resp);

    }
}
