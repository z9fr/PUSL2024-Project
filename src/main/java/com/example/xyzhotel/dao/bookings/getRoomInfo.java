package com.example.xyzhotel.dao.bookings;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getRoomInfo {
    public String room_title(int room_id){
        String room_title = null;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select title from room_info where room_id=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(room_id));

            ResultSet set = statement.executeQuery();

            while (set.next()){
                room_title = set.getString("title");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return room_title;

    }

    public int room_price(int room_id){
        int room_price = 0;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select price from room_info where room_id=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(room_id));

            ResultSet set = statement.executeQuery();

            while (set.next()){
                room_price = set.getInt("price");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return room_price;
    }

    public boolean checkRoomExist(int room_id){

        boolean isValidRoom = false;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select * from room_info where room_id =?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(room_id));

            ResultSet set = statement.executeQuery();
            while (set.next()) {
                isValidRoom = true;
            }

        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }

        return isValidRoom;

    }


    public boolean checkifRoomAlreadyBooked(int room_id, String start_date, String end_date ){

        boolean theroomtaken = false;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select * from bookings where room_id=? and start_date between ? and ? and end_date between ? and ?;";
            // select * from bookings where room_id=5 and start_date between '2022-02-08' and '2022-02-09' and end_date between '2022-02-08' and '2022-02-09';

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(room_id));
            statement.setString(2, start_date);
            statement.setString(3, end_date);
            statement.setString(4, start_date);
            statement.setString(5, end_date);

            ResultSet set = statement.executeQuery();
            while (set.next()) {
                theroomtaken = true;
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }

        return theroomtaken;

    }


}
