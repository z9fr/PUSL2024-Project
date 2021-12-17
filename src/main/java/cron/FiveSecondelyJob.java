package cron;

public class FiveSecondelyJob implements Runnable{
    @Override
    public void run() {
        System.out.println("running the five secon job ");
    }
}
