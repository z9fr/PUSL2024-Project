package com.example.xyzhotel.dao.auth;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class authUser {
    public boolean validateUser(String username, String password) {
        boolean isValidUser = false;
        try {

            Connection connection = dbconnection.getConnectionToDatabase();

            String sql = "select * from users where uname=? and password=?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // execute the statement and check whether user exists

            ResultSet set = statement.executeQuery();
            while (set.next()) {
                isValidUser = true;
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return isValidUser;
    }

    public String getUserRole(String username, String password){

        String role = null;

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select role from users where uname=? and password=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet set = statement.executeQuery();

            while (set.next()){
                role = set.getString("role");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return role;
    }

    public int getUserID(String username, String password){

        int userId = 0;

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select uuid from users where uname=? and password=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet set = statement.executeQuery();

            while (set.next()){
                userId = set.getInt("uuid");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return userId;
    }

}
