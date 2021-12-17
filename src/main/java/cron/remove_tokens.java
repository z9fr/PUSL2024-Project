package cron;

import java.util.Timer;
import java.util.TimerTask;

public class remove_tokens {
    public static void main(String[] args) {

        Timer t = new Timer();
        MyTask mTask = new MyTask();
        // This task is scheduled to run every 10 seconds

        t.scheduleAtFixedRate(mTask, 0, 10000);
    }

}
class MyTask extends TimerTask {

    public MyTask(){
        System.out.println("cron running");
    }

    @Override
    public void run() {
        System.out.println("Hi see you after 10 seconds");
    }

}

