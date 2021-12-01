package com.example.xyzhotel.dao.auth.createUser;

import com.example.xyzhotel.dao.dbconnection;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.SQLException;

public class AddNewUser {
    public boolean createUser(String uname , String email , String password, String verificationid ) throws SQLException {
        Boolean UserAdded = false;
        System.out.println("[*] Requested adding a new User = "+uname);

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "INSERT INTO users(uname, email , password, verificationid) VALUES(? , ? , ?, ?)";

        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , uname);
        statement.setString(2, email);
        statement.setString(3 , password);
        statement.setString(4, verificationid);

        // execute the statement and check whether user exists
        int set = statement.executeUpdate();

        System.out.println("[+] info : User Added = " + set );

        if(set == 1){
            UserAdded = true;
        }

        return UserAdded;
    }

    public Boolean addTokentodb(String verificationid, String token) throws SQLException {
        Boolean isUpdated = false;

        Connection connection = dbconnection.getConnectionToDatabase();
        String sql = "INSERT INTO verfication_token(verificationid,token, isvalid ) VALUES(? , ? ,?)";
        java.sql.PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1 , verificationid);
        statement.setString(2, token);
        statement.setString(3 , String.valueOf(true));

        // execute the statement and check whether user exists
        int set = statement.executeUpdate();

        System.out.println("[+] info : User Added = " + set );

        if(set == 1){
            isUpdated = true;
        }

        return isUpdated;

    }
}


