package com.example.xyzhotel.dao.auth.createUser;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class checkUserExist {

    public boolean checkUsername(String username){
        boolean isUserExist = false;
        try {
            Connection connection = dbconnection.getConnectionToDatabase();

            String sql = "select * from users where uname=?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);

            // execute the statement and check whether user exists
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                isUserExist = true;
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return isUserExist;
    }

    public Boolean checkemailExist(String mail){
        boolean isMailExist = false;
        try {
            Connection connection = dbconnection.getConnectionToDatabase();

            String sql = "select * from users where email=?";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, mail);

            // execute the statement and check whether user exists
            ResultSet set = statement.executeQuery();
            while (set.next()) {
                isMailExist = true;
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return isMailExist;

    }

}
