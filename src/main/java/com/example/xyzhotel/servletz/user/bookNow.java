package com.example.xyzhotel.servletz.user;

import com.example.xyzhotel.dao.bookings.getRoomInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "book Now", value = "/user/booknow")
public class bookNow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getRoomInfo roominformation = new getRoomInfo();
        String roomId = req.getParameter("room");

        if(!roomId.isEmpty()) {
            int room_id = Integer.parseInt(roomId);
            boolean doesRoomExist = roominformation.checkRoomExist(room_id);

            if (doesRoomExist) {



                // getting title
                String room_title = roominformation.room_title(room_id);

                //getting price
                int room_price = roominformation.room_price(room_id);
                System.out.println("[+] " + room_title + " is " + room_price + " rs and passed it to ui");

                req.setAttribute("the_Room_title_for_booking", room_title);
                req.setAttribute("the_Room_price_for_booking", room_price);
                req.setAttribute("the_Room_id_to_booking", room_id);

                req.getRequestDispatcher("/jsp/bookingHomePage.jsp").forward(req, resp);
            }
            else{

                req.setAttribute("error","The Room Does Not Exist Please Try Again!");
                req.getRequestDispatcher("/jsp/bookingHomePage.jsp").forward(req, resp);
            }

        }
        else{
            req.setAttribute("error","Something went Wrong Please Try Again!");
            req.getRequestDispatcher("/jsp/bookingHomePage.jsp").forward(req, resp);
        }

    }

}
