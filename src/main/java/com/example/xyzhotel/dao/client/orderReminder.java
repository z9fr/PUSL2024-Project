package com.example.xyzhotel.dao.client;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class orderReminder {

    public boolean theReminder(String sendTo, String order_id,String username){
        boolean isSuccess = false;

        String mailFrom = "xyzhotel@mail.com";
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
                //Dotenv dotenv = null;
                //dotenv = Dotenv.configure().load();
                //String emailUsername =dotenv.get("EMAIL_USERNAME");
                //String emailPassowrd =dotenv.get("EMAIL_PASSWORD");

                // for some reason dotenv is not working

                return new PasswordAuthentication("xyzhotel@mail.com", "Y3M3$NMig^BTPjKdrMDH");
            }
        });

        session.setDebug(true); // debug smtp

        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mailFrom));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sendTo));


            String mailBody = String.format("""
                    <div id="m_9209355385110310124body" style="background-color:#f8faf4;color:#222222;margin:0;padding:0">
                        <div class="m_9209355385110310124o-full-wrap m_9209355385110310124l-body-container"
                            style="margin:0 auto;background-color:#ffffff;margin-left:auto;margin-right:auto;max-width:600px">
                            <table role="presentation" style="border-collapse:collapse;margin:0;padding:0" "="" cellspacing=" 0"
                                cellpadding="0" border="0">
                                <tbody>
                                    <tr>
                                        <td style="text-align:center;background-color:#21cd9c" valign="center" bgcolor="#21cd9c"
                                            align="center">
                                            <table role="presentation"
                                                style="border-collapse:collapse;margin:0;padding:0" "="" cellspacing=" 0" cellpadding="0"
                                                border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="padding-top:8px;padding-bottom:8px" valign="center" align="center">
                                                            <a href="#" style="text-decoration:none;color:inherit" target="_blank"
                                                                data-saferedirecturl="#">
                                                                s
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table role="presentation" style="border-collapse:collapse;margin:0;padding:0" "cellspacing=" 0" cellpadding="0"
                                border="0">
                                <tbody>
                                    <tr>
                                        <td style="text-align:left;padding:40px" valign="center" bgcolor="#ffffff" align="left">
                                            <p class="m_9209355385110310124text-body"
                                                style="font-weight:300;margin:24px 0px 32px 0px;font-size:16px;color:#222222;text-align:left;font-family:'Basis Grotesque',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen,Ubuntu,Cantarell,'Open Sans','Helvetica Neue',sans-serif">
                                                Hi %s,
                                            </p>
                                            <p class="m_9209355385110310124text-body"
                                                style="font-weight:300;margin:24px 0px 32px 0px;font-size:16px;color:#222222;text-align:left;font-family:'Basis Grotesque',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen,Ubuntu,Cantarell,'Open Sans','Helvetica Neue',sans-serif">
                                                Hoping to see you soon
                                            </p>
                                            <p class="m_9209355385110310124text-body"
                                                style="font-weight:300;margin:24px 0px 32px 0px;font-size:16px;color:#222222;text-align:left;font-family:'Basis Grotesque',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen,Ubuntu,Cantarell,'Open Sans','Helvetica Neue',sans-serif">
                                                Your oder %s is today , cant wait till you to come
                                            </p>
                                            <table style="border-collapse:collapse" "="" cellspacing=" 0" cellpadding="0" border="0">
                         
                                            </table>
                                            If you didn't make this request, you can disregard this message or contact <a href="/report"
                                                target="_blank">Customer
                                                Care</a> for assistance.
                                            <p></p>
                                            <p class="m_9209355385110310124text-body"
                                                style="font-weight:300;margin:0px;font-size:16px;color:#222222;text-align:left;font-family:'Basis Grotesque',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen,Ubuntu,Cantarell,'Open Sans','Helvetica Neue',sans-serif">
                                                Thanks,<br>
                                                XYZHotel Team
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                         
                        </div>
                         
                    </div>\040\040\040\040\040\040\040
                            """, username,order_id );

            // set subject and content
            message.setSubject("Order Complete! ");
            message.setContent( mailBody
                    ,
                    "text/html");

            System.out.println("[*] Debug : Sending the mail ");

            // send the mail
            Transport.send(message);
            System.out.println("[+] Email Send Successfully");
            isSuccess = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return  isSuccess;
    }
}
