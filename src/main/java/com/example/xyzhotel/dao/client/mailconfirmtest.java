package com.example.xyzhotel.dao.client;

/*

    THIS IS A TEST FILE NOT A PART OF THE PROJECT
    THIS FILE IS FOR TESTING FOR THE EMAIL WORKINGS

 */

public class mailconfirmtest {
    public static void main(String[] args) {
        SendMailConfirmation sendConfim = new SendMailConfirmation();

        boolean sendMail = sendConfim.sendConfirmation("1234", "joyito5147@peykesabz.com" , "Dasith", "1");

        if(sendMail){
            System.out.println("[*] Send Email success");
        }
        else{
            System.out.println("[-] Something went wrong ="  +sendMail);
        }

    }
}
