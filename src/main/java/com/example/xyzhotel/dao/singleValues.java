package com.example.xyzhotel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class singleValues {

    public String getRoomImage(int roomId){

        String roomImage = "";

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select room_image from room_info where room_id=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(roomId));

            ResultSet set = statement.executeQuery();

            while (set.next()){
                roomImage = set.getString("room_image");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return roomImage;
    }
}
