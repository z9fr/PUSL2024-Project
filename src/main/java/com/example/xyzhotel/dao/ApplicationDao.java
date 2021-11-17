package com.example.xyzhotel.dao;

import com.example.xyzhotel.beans.room;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDao {

    public List<room> getAllRooms(){
        room room = null;
        List<room> rooms = new ArrayList<>();

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select * from room_info;";
            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()) {
                room = new room();
                room.setRoom_id(set.getInt("room_id"));
                room.setTitle(set.getString("title"));
                room.setRoom_description(set.getString("room_description"));
                room.setRoom_image(set.getString("room_image"));
                rooms.add(room);
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return rooms;


    }
}
