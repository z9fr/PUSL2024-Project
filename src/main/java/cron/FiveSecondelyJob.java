package cron;

import com.example.xyzhotel.dao.reminders.CheckTodayEvents;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FiveSecondelyJob implements Runnable{
    @Override
    public void run() {
        //  check the orders for the day and send mail
        // cleanup the tokens

        // 2021-12-31
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String currentTime = dtf.format(now).toString();

        System.out.println(currentTime);
        CheckTodayEvents eventsday = new CheckTodayEvents();

        System.out.println(eventsday.startUpdatingData(currentTime));

        // check the tokens for today

    }
}
