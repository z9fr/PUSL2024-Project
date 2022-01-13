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

- sending sms
- sending emails
- backrgoud task
- email verification
- payment
- booking - booking collistions
- user login and roles
- Registration Tokens.

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

```java
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

### Handeling Bookings 

so for handelling booking collistions we are basically checking if the room is already booked on the same date when authorizing the payment we are first checking if the room exist 

```java
        // very the room_id
        getRoomInfo roominformation = new getRoomInfo();
        boolean doesRoomExist = roominformation.checkRoomExist(room_id);


        if(doesRoomExist){
            // getting other untrusted data from cookies

            HttpSession session =req.getSession();
            String username = (String) session.getAttribute("username");
            int user_id = (int) session.getAttribute("user_id");
            String room_price = String.valueOf(roominformation.room_price(room_id));

            System.out.println("[+] Booking room for "+room_id + " room price is = "+room_price);
            oderDetails od = new oderDetails(start_date, end_date, reason, room_id, room_price , username , user_id);



            try {
                PaymentService paymentServices = new PaymentService();
                String approvalLink = paymentServices.authorizePayment(od);
                System.out.println("[*] Debug : approval Link = "+approvalLink);
                resp.sendRedirect(approvalLink);


            } catch (PayPalRESTException | SQLException ex) {
                req.setAttribute("errorMessage", ex.getMessage());
                ex.printStackTrace();
            }
        }
```

and the way this whole booking works is first the client sends a request to book the room when he does that we are sendning the request to AuthorizePayment class ( the above servlet ) and from that we init the payment service and request to aproval link from paypal. and then we redirect the user to that link.

after he confirms the payment we are sending the client back to the review payment servlet. this happens from the paypal side. and this servlet is the redirect url 

```java
redirectUrls.setReturnUrl("http://localhost:8080/user/review_payment");
```

here we are starting the process on a thread

```java

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // getting payment and payer id
        String paymentId = req.getParameter("paymentId");
        String payerId = req.getParameter("PayerID");

        theBookingstuff t1 = new theBookingstuff();
        try {
            t1.run(paymentId, payerId, req, resp);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        } catch (PayPalException e) {
            e.printStackTrace();
        }


    }
```


and in the run metord we are passing some args which and from the run metord we pass request to our booking function which is a syncranized function

```java
    public synchronized void booknow(String paymentId,String payerId, HttpServletRequest req, HttpServletResponse resp) throws PayPalRESTException, PayPalException, ServletException, IOException {
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
    }
```

and we are using a synchronized function here because it helps us to prevent memory consistency errors. and in this case thata curusal. 


## User Roles

in our application we do have two roles. one role is for the normal user, and the other role is for the admin users. how we manage routes for these users are normal users can access everything in `/user/*/` while admin users has access to `/admin/*` endpoints. 


### Using Filers

and since its really not practical to use check if user is valid everytime we are using sessions to keep the state of the application. and in the same case we have a we filter setup for `/*` and in that filter we check if user is authenticated. and since there's small amount of roles for the admin. we are checking that on the servlet 

`src\main\java\com\example\xyzhotel\filters\privateRoutes.java`

```java
@WebFilter("/*")
public class privateRoutes implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // todo
    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)arg0;

        if(request.getRequestURI().startsWith("/user") || request.getRequestURI().startsWith("/admin")){

            HttpSession session = request.getSession();

            if(session.getAttribute("username")==null){
                request.getRequestDispatcher("/jsp/auth/login.jsp").forward(request, arg1);
            }
            else if(session.getAttribute("role") == null){
                request.getRequestDispatcher("/jsp/auth/login.jsp").forward(request, arg1);
            }
        }
        arg2.doFilter(request, arg1);
        //post-processing

    }

    @Override
    public void destroy() {
        // todo
    }
}

```

login is handled mainly by the login.java servlet. in here we are taking the usernames from the request. and then we are generating a hash out of this which happens by the `HashPassword` class 

HashPassword.java 
```java
public class HashPassword {
    public String getHash(String password){
        String generatedHash = null;
        try
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] bytes = md.digest();

            // This bytes[] has bytes in decimal format. Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            // Get complete hashed password in hex format
            generatedHash = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return generatedHash;
    }

}

```

Login.java
```java

@WebServlet(name = "Loginroute", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //dispatch the request to login.jsp resource
        RequestDispatcher dispatcher = req.getRequestDispatcher("/jsp/auth/login.jsp");
        dispatcher.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get the username from the login form
        HashPassword hp = new HashPassword();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String hashedPassword = hp.getHash(password);

        System.out.println(hashedPassword);

        //call DAO for validation logic
        authUser dao= new authUser();
        boolean isValidUser = dao.validateUser(username, hashedPassword);

        if(isValidUser){

            String role = dao.getUserRole(username, hashedPassword);
            String email = dao.getUserMail(username );
            int uuid = dao.getUserID(username, hashedPassword);


            if(uuid == 0){
                req.setAttribute("error", "Internal Server Error");
                req.getRequestDispatcher("/jsp/auth/login.jsp").forward(req, resp);
            }

            else{
                HttpSession session = req.getSession();

                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("password", password);
                session.setAttribute("user_id", uuid);
                session.setAttribute("user_email", email);
                

                System.out.println("[+] "+uuid+" "+username+" "+role+" Logged in");

                resp.sendRedirect("/user/panel?msg=LoginSuccess");
            }
        }
        else{
            String errorMessage="Invalid Credentials, please login again!";
            req.setAttribute("error", errorMessage);
            req.getRequestDispatcher("/jsp/auth/login.jsp").forward(req, resp);


        }

    }
}

```

user id, username, email are fetched from the dao layer from the database and we set these information to session so that we can use them to identify the user later.

and something special to notice. we are using parametarized queries. we are using this to make our website more secure. because of we using parameraized queries we are preventing the attack vectors like sql injection which could lead to a authetncation bypass in this case. 

```java

public class authUser {
    public boolean validateUser(String username, String password) {
        boolean isValidUser = false;
        try {

            Connection connection = dbconnection.getConnectionToDatabase();

            String sql = "select * from users where uname=? and password=?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // execute the statement and check whether user exists

            ResultSet set = statement.executeQuery();
            while (set.next()) {
                isValidUser = true;
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return isValidUser;
    }

    public String getUserRole(String username, String password){

        String role = null;

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select role from users where uname=? and password=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet set = statement.executeQuery();

            while (set.next()){
                role = set.getString("role");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return role;
    }

    public int getUserID(String username, String password){

        int userId = 0;

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select uuid from users where uname=? and password=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet set = statement.executeQuery();

            while (set.next()){
                userId = set.getInt("uuid");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return userId;
    }

    public String getUserMail(String username){

        String role = null;

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select email from users where uname=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);

            ResultSet set = statement.executeQuery();

            while (set.next()){
                role = set.getString("email");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return role;
    }

}

```

## Admin dashboard

so the main difference between the admin users. and the normal users. is that the admin users has access to a dashboard which they can use to view / monitor the information about the website as a example visualize the admin dashboard and so and so 

```java
@WebServlet(name = "Admin Route", value = "/user/admin")
public class adminHome extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();
        String role = (String) session.getAttribute("role");

        PrintWriter out = resp.getWriter();


        if(Objects.equals(role, "admin")){
            // give the admin dashboard

            AdminHelper adminhelper = new AdminHelper();


            //getting those numbers
            req.setAttribute("userCount", adminhelper.UserCount());
            req.setAttribute("totalBookings", adminhelper.TotalBookings());
            req.setAttribute("total_room_count", adminhelper.roomCount());

            System.out.println(adminhelper.UserCount());
            req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);

        }
        else{
            out.println("<html><body>");
            out.println("<h1> not admin</h1>");
        }
        out.println(session.getAttribute("role"));
        out.println("</body></html>");
    }
}

```

and admin has the features like admin the rooms to the database. and below is the servlet for the Addmin Rooms.
`/user/admin/add/room` and if we send the to this route we first check if user hash the role admin. we are adding it to the database. 

```java
@WebServlet(name = "add rooms", value = "/user/admin/add/room/")
public class addRooms extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/addRoom.jsp");
        dispatcher.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session =req.getSession();
        String role = (String) session.getAttribute("role");

        PrintWriter out = resp.getWriter();

        if(Objects.equals(role, "admin"))
        {
            String title = (String) req.getParameter("title");
            String price = (String) req.getParameter("price");
            String room_img = (String) req.getParameter("room_image");
            String room_desc = (String) req.getParameter("room_description");

            // add stuff here
            addroomsdao addroom = new addroomsdao();
            try {
                boolean result  = addroom.addroomsdb(title, price , room_img, room_desc);
                resp.sendRedirect("/user/admin?msg=room+added+okay");

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }
}

```


