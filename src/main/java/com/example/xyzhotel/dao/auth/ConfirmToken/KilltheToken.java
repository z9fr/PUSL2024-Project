package com.example.xyzhotel.dao.auth.ConfirmToken;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.SQLException;

public class KilltheToken {
    public Boolean killtoken(String tokenid, String token) throws SQLException {
        Boolean isDead = false;

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "UPDATE verfication_token set isvalid=false WHERE verificationid=? AND token=? ";
        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , tokenid);
        statement.setString(2 , token);

        int set = statement.executeUpdate();

        if(set == 1){
            isDead = true;
        }

        return isDead;

    }
}
