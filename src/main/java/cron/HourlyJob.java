package cron;

public class HourlyJob implements Runnable{
    @Override
    public void run() {
        System.out.println("running the five hour job ");
    }

}
