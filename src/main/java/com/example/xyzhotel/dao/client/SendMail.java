package com.example.xyzhotel.dao.client;


import io.github.cdimascio.dotenv.Dotenv;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import io.github.cdimascio.dotenv.Dotenv;
import io.github.cdimascio.dotenv.DotenvException;


/*

    THIS IS A TEST FILE NOT A PART OF THE PROJECT
    THIS FILE IS FOR TESTING FOR THE EMAIL WORKINGS

 */


public class SendMail {
    public static void main(String[] args) {

        String sendTo = "z9fr@pm.me";
        String mailFrom = "xyzhotel2@mail.com";
        String mailHost = "smtp.mail.com";

        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", mailHost);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // get session obj and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {

                // getting username and password from .env
                Dotenv dotenv = null;
                dotenv = Dotenv.configure().load();
                String emailUsername =dotenv.get("EMAIL_USERNAME");
                String emailPassowrd =dotenv.get("EMAIL_PASSWORD");

                return new PasswordAuthentication(emailUsername, emailPassowrd);
            }
        });

        session.setDebug(true); // debug smtp

        try {
            // create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(mailFrom));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sendTo));

            // set subject and content
            message.setSubject("This is the Subject Line!");
            message.setContent(
                    "<h1>This is actual message embedded in HTML tags</h1>",
                    "text/html");

            System.out.println("[*] Debug : Sending the mail ");

            // send the mail
            Transport.send(message);
            System.out.println("[+] Email Send Successfully");
        }
        catch (MessagingException ex) {
            ex.printStackTrace();
        }

    }
}
