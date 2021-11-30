package com.example.xyzhotel.servletz.payment;

import com.example.xyzhotel.dao.payment.PaymentService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
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

            // getting the payment details

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            req.setAttribute("payer", payerInfo);
            req.setAttribute("transaction", transaction);

            String url = "/review.jsp?pay="+paymentId+"&payerid="+payerId;

            req.getRequestDispatcher(url).forward(req, resp);


        } catch (PayPalRESTException e) {
            e.printStackTrace();
        } catch (PayPalException e) {
            e.printStackTrace();
        }


    }
}
