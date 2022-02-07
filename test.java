public class orderCompleteMail {

    public boolean orderDoneMail(String sendTo, String PaymentId,String username){
        Boolean isSuccess = false;

        String mailFrom = "xyzhotel2@mail.com";
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

                return new PasswordAuthentication(emailUsername, emailPassword);
            }
        });

        session.setDebug(true); // debug smtp

        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mailFrom));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sendTo));


            String mailBody = String.format("""
                ..mail body

                """)
