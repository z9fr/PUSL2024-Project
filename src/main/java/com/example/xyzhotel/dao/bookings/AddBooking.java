package com.example.xyzhotel.dao.bookings;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddBooking{

    public Boolean addBooking(String start_date, String end_date, String reason, int room_id, float room_price , String
                              username , int user_id, String payid) throws SQLException {
        boolean isAdded = false;

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "INSERT INTO bookings(start_date, end_date , booked_by, room_id, paymentAmount, reason" +
                ",pay_id, isComplete) VALUES(? , ? , ?, ?, ? , ? , ? ,?)";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, start_date);
        statement.setString(2, end_date);
        statement.setString(3, String.valueOf(user_id)); // fixed Data truncation error sql
        statement.setInt(4, room_id);
        statement.setFloat(5, room_price);
        statement.setString(6 , reason);
        statement.setString(7 , payid);
        statement.setString(8, "0");

        int set = statement.executeUpdate();

        System.out.println("[+] info : User Added = " + set );

        if(set == 1){
            isAdded = true;
        }

        return isAdded;
    }

    public boolean completeBooking(String payment_id) throws SQLException {

        boolean isComplete = false;

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "update bookings set isComplete=1 where pay_id=?";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1,payment_id);

        int set= statement.executeUpdate();

        if(set ==1){
            isComplete= true;
        }

        return isComplete;
    }

}
