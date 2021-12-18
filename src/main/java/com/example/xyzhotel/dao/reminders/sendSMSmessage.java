package com.example.xyzhotel.dao.reminders;

import com.vonage.client.VonageClient;
import com.vonage.client.sms.MessageStatus;
import com.vonage.client.sms.SmsSubmissionResponse;
import com.vonage.client.sms.messages.TextMessage;

public class sendSMSmessage {

    public Boolean sendMessage(String messageBody, String PersonPhone)
    {
        VonageClient client = VonageClient.builder().apiKey("be3cab9f").apiSecret("ZYiZj0MzO36oLSxA").build();

        TextMessage message = new TextMessage("XYZ Hotel", PersonPhone,messageBody);

        SmsSubmissionResponse response = client.getSmsClient().submitMessage(message);

        if (response.getMessages().get(0).getStatus() == MessageStatus.OK) {
            System.out.println("Message sent successfully.");
        } else {
            System.out.println("Message failed with error: " + response.getMessages().get(0).getErrorText());
        }

        return true;
    }

}
