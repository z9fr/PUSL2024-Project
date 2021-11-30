package com.example.xyzhotel.servletz.payment;

import com.example.xyzhotel.beans.oderDetails;
import com.example.xyzhotel.dao.bookings.getRoomInfo;
import com.example.xyzhotel.dao.payment.PaymentService;
import com.paypal.base.rest.PayPalRESTException;

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
    private static final long serialVersionUID = 1L;
    public void AuthorizePaymentServlet() {
    }

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


            try {
                PaymentService paymentServices = new PaymentService();
                String approvalLink = paymentServices.authorizePayment(od);
                System.out.println("[*] Debug : approval Link = "+approvalLink);

                resp.sendRedirect(approvalLink);


            } catch (PayPalRESTException ex) {
                req.setAttribute("errorMessage", ex.getMessage());
                ex.printStackTrace();
            }

            // {"name":"VALIDATION_ERROR","details":[{"field":"transactions[0].amount","issue":"Transaction amount details (subtotal, tax, shipping)
            // must add up to specified amount total"}],"message":"Invalid request - see details","information_link":
            // "https://developer.paypal.com/docs/api/payments/#errors","debug_id":"c5c0c265ee033"}

        }
        else{
            PrintWriter out= resp.getWriter();
            out.println("<html><body>");
            out.println("<h1> room does not exist </h1>");
        }
    }
}
