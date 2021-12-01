package com.example.xyzhotel.dao.auth.ConfirmToken;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getUserRequestedToken {

    public String getUser(String tokenId){

        String tokenOwner = null;

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select uname from users where verificationid=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, tokenId);

            ResultSet set = statement.executeQuery();

            while (set.next()){
                tokenOwner = set.getString("uname");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return tokenOwner;
    }
}
