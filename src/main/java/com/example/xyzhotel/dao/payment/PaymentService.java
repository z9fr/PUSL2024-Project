package com.example.xyzhotel.dao.payment;

import com.example.xyzhotel.beans.oderDetails;
import com.paypal.api.payments.*;
import com.paypal.base.exception.PayPalException;

import java.util.List;

public class PaymentService {
    private static final String CLIENT_ID = "AZ57ZCggjT13hbVqpMO5N3eGbVOj1bs_mSwUHK7lnU1vWThOaSTxpnn67y7Q_-eOlF2hSUveXNpj859U";
    private static final String CLIENT_SECRET = "EPLYQ3f13BQflF0PdnTrnVorlMlDHj_iuWe1Ve-FVkYrjW_t0CZ_TFnp4TRKENapQf6A_giYKDIyj-n8";
    private static final String MODE = "sandbox";

    public String authorizePayment(oderDetails orderDetail) throws PayPalException {

        Payer payer = getUsername(); // get the username
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTranscations = getTransactionInfo(orderDetail);

    }

    private List<Transaction> getTransactionInfo(oderDetails orderDetail) {
        // Details details = new Details();

        // creating the amount ( total )

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getRoom_price());

        // amount.setDetails() since we dont have details im ignoring this for now

        Transaction transaction = new Transaction(); // creating the new instance of transaction
        transaction.setAmount(amount);

        String description = "Your Oder for" +orderDetail.getRoom_id() + " from "+orderDetail.getStart_date() + " to " + orderDetail.getEnd_date()
                +" for your "+orderDetail.getReason(); // creating a nice description for the transaction

        transaction.setDescription(description);




    }

    private Payer getUsername() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal"); //setting payment Method to PayPal
        PayerInfo payerInfo = new PayerInfo();

        payerInfo.setFirstName("John")
                .setLastName("Nigga")
                .setEmail("compnay@xyzhotel.com"); // add information about the company

        return payer;
    }

    private RedirectUrls getRedirectURLs() {

        // create redirect urls for paypal after payment complete and if user cancel the payment and then return the urls

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/user/review_payment");

        return redirectUrls;
    }




}
