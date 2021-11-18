package com.example.xyzhotel.servletz;

import com.example.xyzhotel.beans.booking;
import com.example.xyzhotel.dao.getBookings;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="OrderInfo", value = "/user/order")
public class orderInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/jsp/orderInfo.jsp").forward(req, resp);


    }
}
