package com.example.xyzhotel.dao.auth.ConfirmToken;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class validateToken {
    public Boolean isTokenAlive(String tokenId , String token) throws SQLException {
        Boolean alive = false;

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "select isvalid from verfication_token where verificationid=? and token=?";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, tokenId);
        statement.setString(2, token);

        ResultSet set = statement.executeQuery();

        while (set.next()){
            alive = set.getBoolean("isvalid");
        }

        return alive;
    }
}
