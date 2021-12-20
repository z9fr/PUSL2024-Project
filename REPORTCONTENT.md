## Stuff using

- [x] java servlets
- [x] jsp pages 
- [x] mysql database 

external libs 
-------------

- [x] com.paypal.sdk  ( paypal )
- [x] io.github.cdimascio (dot env for java)
- [x] com.sun.mail ( sending emails smtp )
- [x] commons-codec ( for hashing - when sending tokens )
- [x] com.vonage ( sending sms messages )

features 
--------

- [x] online reservations
- [x] avoid booking collisions
- [x] visualization of customer feedback for management
- [x] Email notification of reservation and cancelling options
- [x] SMS notification of reservation and cancelling options
- [x] payment handling
- [x] Email Verification when sign up
- [x] Background Jobs to Clean up the Tokens
- [x] Admins can add rooms from the backend 
- [x] Background Job to check Reservations ( sending mails to daily orders )

---

## important code lines

#### sending sms though vonage

```java
public class sendSMSmessage {

    public Boolean sendMessage(String messageBody, String PersonPhone)
    {
        VonageClient client = VonageClient.builder().apiKey("key").apiSecret("secret").build();
        TextMessage message = new TextMessage("XYZ Hotel", PersonPhone,messageBody);
        SmsSubmissionResponse response = client.getSmsClient().submitMessage(message);
        if (response.getMessages().get(0).getStatus() == MessageStatus.OK) { System.out.println("Message sent successfully."); } 
        System.out.println("Message failed with error: " + response.getMessages().get(0).getErrorText());
        
        return true;
    }

}

```

#### Sending emails 

```java

 public static void main(String[] args) {

        String sendTo = "z9fr@pm.me";
        String mailFrom = "xyzhotel@mail.com";
        String mailHost = "smtp.mail.com";

        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", mailHost);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {

                Dotenv dotenv = null;
                dotenv = Dotenv.configure().load();
                String emailUsername =dotenv.get("EMAIL_USERNAME");
                String emailPassowrd =dotenv.get("EMAIL_PASSWORD");

                return new PasswordAuthentication(emailUsername, emailPassowrd);
            }
        });

        session.setDebug(true); // debug smtp

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mailFrom));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sendTo));
            message.setSubject("This is the Subject Line!");
            message.setContent(
                    "<h1>This is actual message embedded in HTML tags</h1>",
                    "text/html");

            System.out.println("[*] Debug : Sending the mail ");
            Transport.send(message);
            System.out.println("[+] Email Send Successfully");
        }
        catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

```

#### Background Task 

we have setup some background workers to do jobs ( clean up junk , check for events and send sms/ email)

```java
@WebListener
public class BackgroundJobManager implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(new DailyJob(), 0, 1, TimeUnit.DAYS);
        scheduler.scheduleAtFixedRate(new HourlyJob(), 0, 1, TimeUnit.HOURS);
        scheduler.scheduleAtFixedRate(new FiveSecondelyJob(), 0, 5, TimeUnit.SECONDS);
    }
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }

}

```

basically we run this on new thread and then as a example if we view the FiveSecondelyJob which is basic cron that exec every 5 secs 

```java
public class FiveSecondelyJob implements Runnable{
    @Override
    public void run() {

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String currentTime = dtf.format(now).toString();

        System.out.println(currentTime);
        CheckTodayEvents eventsday = new CheckTodayEvents();

        System.out.println(eventsday.startUpdatingData(currentTime));
    }
}
```

you can see we are taking todays date in the format ("yyyy-MM-dd") which is mysql format and then we call check today events which checks events and add the events for the day to a database table 

```bash
MariaDB [xyzhotel]> desc booking_reminders;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| remind_id  | int(11)      | NO   | PRI | NULL    | auto_increment |
| start_date | varchar(256) | YES  |     | NULL    |                |
| end_date   | varchar(256) | YES  |     | NULL    |                |
| isDone     | tinyint(1)   | YES  |     | NULL    |                |
| booking_id | varchar(256) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
5 rows in set (0.010 sec)

MariaDB [xyzhotel]> 
```

like so after that we send mails to these and we update isDone table after a day we are doing a clean up to clean the databse and remove the junk

#### Email verification 

Email verification is a feature we implemented on our application. when user registers and enter the email first we verify the email if its a corret email or not 

```java
  public static boolean isValidEmailAddress(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = false;
        }
        return result;
    }
```

after we verify the emal is okay we will generate a uniqute uuid 

```java
 public String getUniqueKey() {
        String uniqueKey = String.valueOf(UUID.randomUUID());
        return uniqueKey;
    }
```
and so we generate a token

```java
    public String getToken(String email , String uname) throws NoSuchAlgorithmException {
        Dotenv dotenv = null;
        dotenv = Dotenv.configure().load();
        String secret =dotenv.get("SIGN_UP_SECRET");

        String tohashString = email+uname+secret;
        String sha256hex = DigestUtils.shaHex(tohashString);

        System.out.println("[*] Debug : Secret Generated for User "+uname+ "\nToken => "+sha256hex);

        return sha256hex;
    }

```

also we sign the token with a secret on the .env file and then we create the user and send him a email


---

### Payment 

so payment iniciates in the autorize payment servlet by calling the PaymentService Class

```java

PaymentService paymentServices = new PaymentService();
String approvalLink = paymentServices.authorizePayment(od);
System.out.println("[*] Debug : approval Link = "+approvalLink);
resp.sendRedirect(approvalLink);

```


first to init the transcation we are requesting the authorizePayment and we are requesting approvalLink, in the autorizePayment function it does lot of things

```jaVA

    public String authorizePayment(oderDetails orderDetail)
            throws PayPalRESTException, SQLException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInfo(orderDetail); // taking order details here

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);
        String payment_id = approvedPayment.getId().toString();
        System.out.println("[***] Debug Request Payment id =>" + payment_id);

        AddBooking addbooking = new AddBooking();
        boolean checkBooking = addbooking.addBooking(orderDetail.getStart_date(), orderDetail.getEnd_date(), orderDetail.getReason(),
                orderDetail.getRoom_id(), Float.parseFloat(orderDetail.getRoom_price()), orderDetail.getUsername(), orderDetail.getUser_id(),
                payment_id);
        System.out.println("[***] Check Booking Status => "+checkBooking);

        return getApprovalLink(approvedPayment);
    }
```
and getting the aproval link is also private function which contain

```java
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

```
after getting the aproval link from the servlet we are redirecting the user to the approval link basically when the payment is ok and so it will call to our callbackurl 

```java

    private RedirectUrls getRedirectURLs() {

        // create redirect urls for paypal after payment complete and if user cancel the payment and then return the urls

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/user/review_payment");
        return redirectUrls;
    }

```

which you can see here if the user click on cancel we are sending them to cancel page which just tells that the order was not complete and info but if the order was okay we are sending him to review-payment servlet 

which runs on a new thread to avoid booking collisions we dont wanted to do that on auth payment because it was just sending the redirect to the database but this is the part where we need to be careful with collisions so this process runs on different thread 

```java

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // getting payment and payer id
        String paymentId = req.getParameter("paymentId");
        String payerId = req.getParameter("PayerID");
        theBookingstuff t1 = new theBookingstuff();
        t1.run(paymentId, payerId, req, resp);
    }
```

as you can see here we call the run here which contain the logic 

```java

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
```