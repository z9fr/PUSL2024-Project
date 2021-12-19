package com.example.xyzhotel.dao.reminders;

import com.example.xyzhotel.beans.EventsToday;
import com.example.xyzhotel.dao.client.orderReminder;
import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.ConsoleHandler;

public class CheckTodayEvents {
    public List<EventsToday> getAlleventsFortheDay(String todaysDate){
        EventsToday events = null;
        List<EventsToday> allevents = new ArrayList<>();
        System.out.println("[*] Calling getAlleventsFortheDay Table ");

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "SELECT * FROM booking_reminders where start_date=?;";

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
            // possible sql injection here but since there's no way someone can exploit it we are safe
            // the reason why im doing it was prepared statements wasn't working maybe because of the date format ?
            String sql = "SELECT * FROM bookings where start_date=\"" +todaysDate+ "\";";


            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()) {
                // update the values from here
                String start_date = set.getString("start_date");
                String end_date = set.getString("end_date");
                int booking_id = set.getInt("booking_id");

                System.out.println("[1] Calling updatetheValuesto Table ");
                Boolean status = updatetheValuestoTable(start_date, end_date, booking_id);
                isComplete=true;
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }

        return isComplete;
    }



    public Boolean updatetheValuestoTable(String start_date, String end_date , int booking_id) throws SQLException {
        boolean isSuccess = false;

        // check if the value is alr available
        System.out.println("[2] Calling checkValuesAvailable");
        boolean isAvailible = checkValuesAvailable(booking_id);

        if(isAvailible){ return true;}

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "INSERT INTO booking_reminders(start_date, end_date , booking_id, isDone) VALUES(? , ? , ?, ?)";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , start_date);
        statement.setString(2, end_date);
        statement.setInt(3 , booking_id);
        statement.setBoolean(4, false);

        int set = statement.executeUpdate();

        // init the mail here
        System.out.println("[2] Calling mailInit");
        boolean mailinitStatus = mailInit(booking_id);

        if(mailinitStatus){ isSuccess = true; }
        return isSuccess;
    }

    public Boolean mailInit(int booking_id) throws SQLException {
        // select * from booking_reminders where booking_id=4& isDone=false;

        boolean mailinitok = false;

        Connection connection = dbconnection.getConnectionToDatabase();

        String sql = "select booking_id from booking_reminders where booking_id="+booking_id+"&isDone=false;";

        Statement statement = connection.createStatement();
        ResultSet set = statement.executeQuery(sql);

        while (set.next()) {
            // update the values from here
            int theid = set.getInt("booking_id");

            System.out.println("[4] mail senidng ...");
            Boolean status = sendMail(booking_id);

            if(status)
            {
                String updateSQl = "UPDATE booking_reminders SET isDone=true WHERE booking_id="+booking_id;
                Statement updateStatement = connection.createStatement();
                updateStatement.execute(updateSQl);

                mailinitok= true;
            }
        }

        return mailinitok;

    }


    public Boolean checkValuesAvailable(int booking_id) throws SQLException {
        boolean isValid = false;
        Connection connection = dbconnection.getConnectionToDatabase();

        String sql = "select * from booking_reminders where booking_id=?";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, String.valueOf(booking_id));

        ResultSet set = statement.executeQuery();
        while (set.next()) {
            isValid = true;
        }
        return isValid;

    }

    public Boolean sendMail(int booking_id) throws SQLException {
        // get order id booked by from the db and the email

        // select uname,email,booking_id from bookings  inner join users on bookings.booked_by=users.uuid where bookings.booking_id=4;

        boolean isDoneRemind = false;
        Connection connection = dbconnection.getConnectionToDatabase();

        String sql = "select uname,email,booking_id,phoneNumber from bookings  inner join users on bookings.booked_by=users.uuid where bookings.booking_id="+booking_id;
        Statement statement = connection.createStatement();


        // mail
        // username
        // booking id
        ResultSet set = statement.executeQuery(sql);

        while (set.next()) {
            // update the values from here
            String uname = set.getString("uname");
            String email = set.getString("email");
            String pnum = set.getString("phoneNumber");

            orderReminder op = new orderReminder();
            sendSMSmessage sendsms = new sendSMSmessage();

            boolean doneMail = op.theReminder(email, String.valueOf(booking_id), uname);

            String smsBody = "Hi "+uname+" we are waiting for you to come today for your oder number "+booking_id;
            sendsms.sendMessage(smsBody, pnum);

            if( doneMail) { return  true; }
            System.out.println("email didnt success");
        }
        return false;

    }
}
