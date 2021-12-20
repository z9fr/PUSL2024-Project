package cron;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.ConsoleHandler;

public class cleanupTokens {
    public void docleanTokens() throws SQLException {
        Connection connection = dbconnection.getConnectionToDatabase();

        // delete from verfication_token where isvalid=0;
        String sql = "delete from verfication_token where isvalid=0;";

        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery(sql);

        System.out.println("[+] clean up tokens status =>"+set);

    }
}
