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
}
