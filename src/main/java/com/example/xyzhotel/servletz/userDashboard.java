package com.example.xyzhotel.servletz;

import com.example.xyzhotel.beans.review;
import com.example.xyzhotel.beans.room;
import com.example.xyzhotel.dao.homeInfo;
import com.example.xyzhotel.dao.randomQuote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "user Dashboard", value = "/user/panel")
public class userDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        // Getting values for posts
        homeInfo dao = new homeInfo();
        List<room> rooms = dao.getAllRooms();
        req.setAttribute("latestRooms", rooms);

        req.getRequestDispatcher("/jsp/userDashboard.jsp").forward(req, resp);
    }
}
