package com.example.xyzhotel.dao.payment;

import com.example.xyzhotel.beans.oderDetails;
import com.paypal.api.payments.*;
import com.paypal.base.exception.PayPalException;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import java.util.ArrayList;
import java.util.List;

public class PaymentService {
    private static final String CLIENT_ID = "AZ57ZCggjT13hbVqpMO5N3eGbVOj1bs_mSwUHK7lnU1vWThOaSTxpnn67y7Q_-eOlF2hSUveXNpj859U";
    private static final String CLIENT_SECRET = "EPLYQ3f13BQflF0PdnTrnVorlMlDHj_iuWe1Ve-FVkYrjW_t0CZ_TFnp4TRKENapQf6A_giYKDIyj-n8";
    private static final String MODE = "sandbox";


    public String authorizePayment(oderDetails orderDetail)
            throws PayPalRESTException {

        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInfo(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        return getApprovalLink(approvedPayment);

    }

    private String getApprovalLink(Payment approvedPayment) {

        // getting the approval link and return it

        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }

    private List<Transaction> getTransactionInfo(oderDetails od) {

        Details details = new Details();
        details.setSubtotal(od.getRoom_price());
        details.setTax(String.valueOf(0.00));
        details.setShipping(String.valueOf(0.00));

        // 12121.00

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(od.getRoom_price());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);

        String tdesc = "Your Oder for" +od.getRoom_id() + " from "+od.getStart_date() + " to " + od.getEnd_date()
                +" for your "+od.getReason(); // creating a nice description for the transaction

        transaction.setDescription(tdesc);


        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(String.valueOf(od.getRoom_id()));
        item.setPrice(od.getRoom_price());
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;

    }

    private Payer getPayerInformation() {
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

    public Payment getPaymentDetails(String paymentId) throws PayPalException, PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return  Payment.get(apiContext, paymentId);
    }

    public Payment doPayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }

}
// 12121