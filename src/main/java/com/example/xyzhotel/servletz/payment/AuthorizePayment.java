package com.example.xyzhotel.servletz.payment;

import com.example.xyzhotel.dao.bookings.getRoomInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "validate payemnts and stff ", value = "/user/authorize_payment")
public class AuthorizePayment extends HttpServlet {

    // get post values

    // create new oder detail class

    // create instance of payment services and handle the payment

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // getting params from post request
        String start_date = req.getParameter("start_date");
        String end_date = req.getParameter("end_date");
        String reason = req.getParameter("reason");
        int room_id = Integer.parseInt(req.getParameter("room_id"));


        // very the room_id
        getRoomInfo roominformation = new getRoomInfo();
        boolean doesRoomExist = roominformation.checkRoomExist(room_id);

        PrintWriter out= resp.getWriter();
        out.println("<html><body>");

        if(doesRoomExist){
            // getting other untrusted data from cookies

            HttpSession session =req.getSession();
            String username = (String) session.getAttribute("username");
            int user_id = (int) session.getAttribute("user_id");
            int room_price = roominformation.room_price(room_id);

            System.out.println("[+] Booking room for "+room_id + " room price is = "+room_price);

            out.println("<h1>" + start_date + "</h1>");
            out.println("<h1> price -> " + room_price  + "</h1>");
            out.println("<h1>" + end_date + "</h1>");
            out.println("<h1> reason -> " + reason + "</h1>");
            out.println("<h1>" + room_id + "</h1>");
            out.println("<h1>" + username + "</h1>");
            out.println("<h1>" + user_id + "</h1>");
            out.println("<h1>" + session.getAttribute("role") + "</h1>");
            out.println("</body></html>");

        }
        else{
            out.println("<h1> room does not exist </h1>");
        }
    }
}
