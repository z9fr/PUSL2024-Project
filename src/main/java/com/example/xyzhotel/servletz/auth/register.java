package com.example.xyzhotel.servletz.auth;

import com.example.xyzhotel.dao.auth.createUser.AddNewUser;
import com.example.xyzhotel.dao.auth.createUser.checkUserExist;
import com.example.xyzhotel.dao.client.SendMailConfirmation;
import io.github.cdimascio.dotenv.Dotenv;
import org.apache.commons.codec.digest.DigestUtils;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException; 
import java.util.UUID;

@WebServlet(name = "sign up" , value = "/signup")
public class register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/jsp/auth/signup.jsp");
        requestDispatcher.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter writer = resp.getWriter();
        writer.println("<html> <body>");

        String uname = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phoneNumber = req.getParameter("phoneNumber");

        checkUserExist checkuinfo = new checkUserExist();

        Boolean isValidmail = isValidEmailAddress(email);

        if(isValidmail){

            Boolean userExist = checkuinfo.checkUsername(uname);
            Boolean mailExist = checkuinfo.checkemailExist(email);

            if(userExist || mailExist){
                req.setAttribute("error", "The Username or Email Already Taken");
                req.getRequestDispatcher("/jsp/auth/signup.jsp").forward(req, resp);
            }

            else {

                String verificationid = getUniqueKey();
                String token = getUniqueKey();

                AddNewUser addNewUser = new AddNewUser();

                try {
                    // adding tokens to the token db
                    Boolean addtoken = addNewUser.addTokentodb(verificationid, token);


                    if(addtoken){
                        System.out.println("[*] Info : Token added to the db = "+verificationid);

                        // adding the user to the db
                        Boolean userCreated = addNewUser.createUser(uname, email, password, verificationid, phoneNumber);

                        if(userCreated){

                            SendMailConfirmation smc = new SendMailConfirmation();
                            boolean sendMail = smc.sendConfirmation(token, email , uname, verificationid);

                            System.out.println(sendMail);

                            if(sendMail){
                                req.setAttribute("success_msg", "Account Created Success Please check your email");
                                req.getRequestDispatcher("/jsp/auth/signup.jsp").forward(req, resp);
                            }
                            req.setAttribute("error", "Sending confirmation email failed :( ");
                        }
                        else{
                            req.setAttribute("error", "Something went wrong while creating a account :( ");
                        }
                        req.getRequestDispatcher("/jsp/auth/signup.jsp").forward(req, resp);
                    }
                }
                catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else{
            req.setAttribute("error", "Please Enter a Valid Email");
            req.getRequestDispatcher("/jsp/auth/signup.jsp").forward(req, resp);
        }


    }

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

    public String getUniqueKey() {
        String uniqueKey = String.valueOf(UUID.randomUUID());
        return uniqueKey;
    }

    public String getToken(String email , String uname) throws NoSuchAlgorithmException {
        Dotenv dotenv = null;
        dotenv = Dotenv.configure().load();
        String secret =dotenv.get("SIGN_UP_SECRET");

        // generating a confirmation using email username and sign it with a secret
        String tohashString = email+uname+secret;

        // hash this string sha256

        String sha256hex = DigestUtils.shaHex(tohashString);

        System.out.println("[*] Debug : Secret Generated for User "+uname+ "\nToken => "+sha256hex);

        return sha256hex;
    }



}
