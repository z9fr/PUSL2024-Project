package com.example.xyzhotel.dao.reminders;

import com.example.xyzhotel.beans.EventsToday;
import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CheckTodayEvents {
    public List<EventsToday> getAlleventsFortheDay(String todaysDate){
        EventsToday events = null;
        List<EventsToday> allevents = new ArrayList<>();

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "SELECT * FROM bookig_remindrs where start_date=?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, todaysDate);

            ResultSet set = statement.executeQuery(sql);

            while (set.next()) {
                // update the values from here
                events = new EventsToday();
                events.setStart_date(set.getString("start_date"));
                events.setEnd_date(set.getString("end_date"));
                events.setBooking_id(set.getInt("booking_id"));
                allevents.add(events);
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return allevents;
    }

    public Boolean startUpdatingData(String todaysDate){
        boolean isComplete = false;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "SELECT * FROM bookings where start_date=?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, todaysDate);

            ResultSet set = statement.executeQuery(sql);

            while (set.next()) {
                // update the values from here
                String start_date = set.getString("start_date");
                String end_date = set.getString("end_date");
                int booking_id = set.getInt("booking_id");
                Boolean status = updatetheValuestoTable(start_date, end_date, booking_id);
                if(status){ isComplete=true; }
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return isComplete;
    }



    public Boolean updatetheValuestoTable(String start_date, String end_date , int booking_id) throws SQLException {
        boolean isSuccess = false;

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "INSERT INTO bookig_remindrs(start_date, end_date , booking_id, isDone) VALUES(? , ? , ?, ?)";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , start_date);
        statement.setString(2, end_date);
        statement.setInt(3 , booking_id);
        statement.setBoolean(4, false);


        int set = statement.executeUpdate();

        System.out.println("[+] info : got the today's events= " + set );

        if(set == 1){
            isSuccess = true;
        }

        return isSuccess;
    }


}
