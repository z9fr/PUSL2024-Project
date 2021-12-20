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