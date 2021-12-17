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

        theBookingstuff t1 = new theBookingstuff();
        t1.run(paymentId, payerId, req, resp);


    }
}
class theBookingstuff implements Runnable{
    public void run(String paymentId,String payerId, HttpServletRequest req, HttpServletResponse resp) {
        try
        {
            PaymentService paymentService = new PaymentService();
            Payment payment = paymentService.getPaymentDetails(paymentId);

            // getting the payment details

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            req.setAttribute("payer", payerInfo);
            req.setAttribute("transaction", transaction);

            System.out.println("[*] Debug : Generating the Url to Complete Payment ");
            System.out.println("[*] Debug : Payment ID from auth payment  = " + paymentId);
            System.out.println("[*] Debug : Payer ID = " + payerId);


            String url = "/jsp/payment/review.jsp?paymentid="+paymentId+"&payerid="+payerId;

            System.out.println("[***] Debug : complete payment id = " + paymentId);
            System.out.println("[*] Debug : Redirect URL = " + url);
            req.getRequestDispatcher(url).forward(req, resp);


        } catch (PayPalRESTException | ServletException | PayPalException | IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void run() {

    }
}