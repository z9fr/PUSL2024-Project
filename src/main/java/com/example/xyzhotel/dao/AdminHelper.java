package com.example.xyzhotel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AdminHelper {
    public int UserCount(){
        int count = 0;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select count(*) from users;";

            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()){
                count = set.getInt("count(*)");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return count;
    }

    public int TotalBookings(){
        int count = 0;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select count(*) from bookings;";

            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()){
                count = set.getInt("count(*)");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return count;
    }
}
