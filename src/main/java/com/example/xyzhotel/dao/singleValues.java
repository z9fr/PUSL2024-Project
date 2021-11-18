package com.example.xyzhotel.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class singleValues {

    //getting the room image
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

    //getting the room title

    public String getRoomTitle(int roomId){
        String title = "";
        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select title from room_info where room_id=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(roomId));

            ResultSet set = statement.executeQuery();

            while (set.next()){
                title = set.getString("title");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return title;
    }

    // getting the room description

    public String getRoomDesc(int roomId){
        String room_description = "";
        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select room_description from room_info where room_id=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(roomId));

            ResultSet set = statement.executeQuery();

            while (set.next()){
                room_description = set.getString("room_description");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return room_description;
    }


}
