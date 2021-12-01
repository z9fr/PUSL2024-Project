package com.example.xyzhotel.dao.auth.ConfirmToken;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.SQLException;

public class UpdateUserVerification {
    public boolean updateVerification(String uname, String token) throws SQLException {
        Boolean isUpdated = false;

        // UPDATE users set isVerified=false WHERE uname="z9fr" AND verificationid="f41f6bae-c5f4-4e92-a534-c4e49c7a704a";
        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "UPDATE users set isVerified=true WHERE uname=? AND verificationid=?";
        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , uname);
        statement.setString(2, token);

        int set = statement.executeUpdate();

        System.out.println("[+] info : User Added = " + set );

        if(set == 1){
            isUpdated = true;
        }

        return isUpdated;

    }
}
