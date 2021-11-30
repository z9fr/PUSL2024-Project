package com.example.xyzhotel.servletz.payment;

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
import java.io.IOException;

@WebServlet(name = "Complete The Payment" , value = "/user/complete_pay")
public class CompletePay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String paymentid = req.getParameter("payid");
        String payerid = req.getParameter("payerid");

        System.out.println("[*] Debug : Payment Information for Complete payment ");
        System.out.println("[*] Debug : Payment ID = " + paymentid);
        System.out.println("[*] Debug : Payer ID = " + payerid);


        try{
            PaymentService ps = new PaymentService();
            Payment payment = ps.doPayment(paymentid, payerid); // executing the payment

            PayerInfo payerInfo  = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            req.setAttribute("payer", payerInfo);
            req.setAttribute("transaction", transaction);

            req.getRequestDispatcher("/jsp/payment/complete.jsp").forward(req, resp);


        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }


    }
}
