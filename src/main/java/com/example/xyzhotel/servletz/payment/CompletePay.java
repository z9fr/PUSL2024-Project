package com.example.xyzhotel.servletz.payment;

import com.example.xyzhotel.dao.bookings.AddBooking;
import com.example.xyzhotel.dao.client.SendMail;
import com.example.xyzhotel.dao.client.SendMailConfirmation;
import com.example.xyzhotel.dao.client.orderCompleteMail;
import com.example.xyzhotel.dao.payment.PaymentService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Complete The Payment" , value = "/user/complete_pay")
public class CompletePay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String paymentid = req.getParameter("payid");
        String payerid = req.getParameter("payerid");

        HttpSession session = req.getSession();

        System.out.println("[*] Debug : Payment Information for Complete payment ");
        System.out.println("[*] Debug : Payment ID = " + paymentid);
        System.out.println("[*] Debug : Payer ID = " + payerid);

        try{
            PaymentService ps = new PaymentService();
            Payment payment = ps.doPayment(paymentid, payerid); // executing the payment

            PayerInfo payerInfo  = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            String mail = (String) session.getAttribute("user_email");
            String uname = (String) session.getAttribute("username");


            req.setAttribute("payer", payerInfo);
            req.setAttribute("transaction", transaction);

            AddBooking bookings = new AddBooking();
            boolean bookingComplete = bookings.completeBooking(paymentid);

            if(bookingComplete){
                System.out.println(mail);

                orderCompleteMail smc = new orderCompleteMail();
                boolean sendMail = smc.orderDoneMail(mail, paymentid, uname);



                if(sendMail){
                    req.getRequestDispatcher("/jsp/payment/complete.jsp").forward(req, resp);
                }else{
                    req.getRequestDispatcher("/jsp/payment/failedoutside.jsp?msg=Sending+mail+failed");
                }


            }
            else{
                req.getRequestDispatcher("/jsp/payment/failedoutside.jsp");
            }

        } catch (PayPalRESTException | SQLException e) {
            e.printStackTrace();
        }


    }
}
