package com.example.xyzhotel.dao.admin;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.SQLException;

public class addroomsdao {
    public Boolean addroomsdb(String title, String price , String room_img , String room_desc ) throws SQLException {
        Connection connection = dbconnection.getConnectionToDatabase();

        String sql = "INSERT INTO room_info(title, room_description , room_image, price) VALUES(?, ? , ?, ?)";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , title);
        statement.setString(2, room_desc);
        statement.setString(3 , room_img);
        statement.setString(4, price);

        int set = statement.executeUpdate();
        return set == 1;
    }
}
