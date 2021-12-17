package com.example.xyzhotel.servletz;

import com.example.xyzhotel.beans.review;
import com.example.xyzhotel.beans.room;
import com.example.xyzhotel.dao.ApplicationDao;
import com.example.xyzhotel.dao.homeInfo;
import cron.DailyJob;
import cron.HourlyJob;
import cron.remove_tokens;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;


@WebServlet(name = "webroot", value = "/home")
public class home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        homeInfo dao = new homeInfo();

        // last four ratings
        List<review> reviews = dao.getTopReviews();
        req.setAttribute("topreviews", reviews);

        // need the last three rooms

        List<room> rooms = dao.getAllRooms();

        req.setAttribute("latestRooms", rooms);
        req.getRequestDispatcher("/jsp/thehomepage.jsp").forward(req, resp);

    }
}

