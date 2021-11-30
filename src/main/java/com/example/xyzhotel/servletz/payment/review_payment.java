package com.example.xyzhotel.servletz.payment;

import com.example.xyzhotel.dao.payment.PaymentService;
import com.paypal.api.payments.Payment;
import com.paypal.base.exception.PayPalException;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="review the payment" , value = "/user/review_payment")
public class review_payment extends HttpServlet {

    private static final long serialVersionUID = 1L;



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // getting payment and payer id
        String paymentId = req.getParameter("paymentId");
        String payerId = req.getParameter("PayerID");

        try
        {
            PaymentService paymentService = new PaymentService();
            Payment payment = paymentService.getPaymentDetails(paymentId);


        } catch (PayPalRESTException e) {
            e.printStackTrace();
        } catch (PayPalException e) {
            e.printStackTrace();
        }


    }
}
