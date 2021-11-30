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

    public String authorizePayment(oderDetails orderDetail) throws PayPalException {

        Payer payer = getUsername(); // get the username
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTranscations = getTransactionInfo(orderDetail);

        Payment requestPayment = new Payment(); // requesting the payment

        // setting the details
        requestPayment.setTransactions(listTranscations);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = null;
        try {
            approvedPayment = requestPayment.create(apiContext);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }

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

    private List<Transaction> getTransactionInfo(oderDetails orderDetail) {
        Details details = new Details();
        details.setSubtotal(orderDetail.getRoom_price());
        details.setTax("0");

        System.out.println("[*] Debug : Price = " +orderDetail.getRoom_price());

        // creating the amount ( total )
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getRoom_price());
        amount.setDetails(details);

        Transaction transaction = new Transaction(); // creating the new instance of transaction
        transaction.setAmount(amount);

        String description = "Your Oder for" +orderDetail.getRoom_id() + " from "+orderDetail.getStart_date() + " to " + orderDetail.getEnd_date()
                +" for your "+orderDetail.getReason(); // creating a nice description for the transaction

        transaction.setDescription(description); // set the generated description

        // creating the item list

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        // set details for item list
        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getUsername());
        item.setPrice(orderDetail.getRoom_price());
        item.setQuantity("1");

        items.add(item); // adding item to the items list
        itemList.setItems(items);
        transaction.setItemList(itemList);

        // add transactions to list transaction list and return the list
        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;

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

    public Payment getPaymentDetails(String paymentId) throws PayPalException, PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return  Payment.get(apiContext, paymentId);
    }

}
