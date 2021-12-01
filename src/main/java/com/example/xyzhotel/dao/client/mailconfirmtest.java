package com.example.xyzhotel.dao.client;

public class mailconfirmtest {
    public static void main(String[] args) {
        SendMailConfirmation sendConfim = new SendMailConfirmation();

        boolean sendMail = sendConfim.sendConfirmation("1234", "z9fr@pm.me" , "Dasith", "1");

        if(sendMail){
            System.out.println("[*] Send Email success");
        }
        else{
            System.out.println("[-] Something went wrong ="  +sendMail);
        }

    }
}
