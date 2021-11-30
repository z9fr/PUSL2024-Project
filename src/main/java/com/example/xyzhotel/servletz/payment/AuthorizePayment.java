package com.example.xyzhotel.servletz.payment;

import com.example.xyzhotel.beans.oderDetails;
import com.example.xyzhotel.dao.bookings.getRoomInfo;
import com.example.xyzhotel.dao.payment.PaymentService;
import com.paypal.base.exception.PayPalException;

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

        System.out.println("[*] Debug : request got for authorize_payment");

        // getting params from post request
        String start_date = req.getParameter("start_date");
        String end_date = req.getParameter("end_date");
        String reason = req.getParameter("reason");
        int room_id = Integer.parseInt(req.getParameter("room_id"));


        // very the room_id
        getRoomInfo roominformation = new getRoomInfo();
        boolean doesRoomExist = roominformation.checkRoomExist(room_id);


        if(doesRoomExist){
            // getting other untrusted data from cookies

            HttpSession session =req.getSession();
            String username = (String) session.getAttribute("username");
            int user_id = (int) session.getAttribute("user_id");
            String room_price = String.valueOf(roominformation.room_price(room_id));

            System.out.println("[+] Booking room for "+room_id + " room price is = "+room_price);
            oderDetails od = new oderDetails(start_date, end_date, reason, room_id, room_price , username , user_id);

            try
            {
                PaymentService paymentService = new PaymentService();
                String approvalLink = paymentService.authorizePayment(od);

                System.out.println("[*] Debug : approval Link = "+approvalLink);

                resp.sendRedirect(approvalLink);

            }
            catch (PayPalException e) {
                e.printStackTrace();
                // display error i guess
            }
        }
        else{
            PrintWriter out= resp.getWriter();
            out.println("<html><body>");
            out.println("<h1> room does not exist </h1>");
        }
    }
}
