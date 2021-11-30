package com.example.xyzhotel.dao.payment;

import com.example.xyzhotel.beans.oderDetails;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.base.exception.PayPalException;

public class PaymentService {
    private static final String CLIENT_ID = "AZ57ZCggjT13hbVqpMO5N3eGbVOj1bs_mSwUHK7lnU1vWThOaSTxpnn67y7Q_-eOlF2hSUveXNpj859U";
    private static final String CLIENT_SECRET = "EPLYQ3f13BQflF0PdnTrnVorlMlDHj_iuWe1Ve-FVkYrjW_t0CZ_TFnp4TRKENapQf6A_giYKDIyj-n8";
    private static final String MODE = "sandbox";

    public String authorizePayment(oderDetails orderDetail) throws PayPalException {

        Payer payer = getUsername(); // get the username
        RedirectUrls redirectUrls = getRedirectURLs();

    }

    private Payer getUsername() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal"); //setting payment Method to paypal
        PayerInfo payerInfo = new PayerInfo();
    }

    private RedirectUrls getRedirectURLs() {

        // create redirect urls for paypal after payment complete and if user cancel the payment and then return the urls

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/user/review_payment");

        return redirectUrls;
    }




}
