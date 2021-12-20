package cron;

import java.sql.SQLException;

public class DailyJob implements Runnable{

    @Override
    public void run() {
        // clean the db here a bit
        cleanupTokens ct = new cleanupTokens();
        try {
            ct.docleanTokens();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
