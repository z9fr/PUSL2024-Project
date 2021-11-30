package com.example.xyzhotel.dao.user;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class submitFeedback {
    public boolean updateFeedBack(String feedback, int rating, String UserName) {
        boolean completeUpdate = false;

        try {

            System.out.println("[+] Review requested username : " +UserName);
            System.out.println("[+] Review Feedback : " +feedback);
            System.out.println("[+] Rating Count : " +rating);

            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "INSERT INTO reviews(review_content,review_starts, review_user) VALUES(? , ? , ?)";

            // setting values for parametrized query
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, feedback);
            statement.setString(2, String.valueOf(rating));
            statement.setString(3, UserName);


            // execute the statement and check whether user exists
            int set = statement.executeUpdate();

            System.out.println("[+] set value -> " + set );

            if(set == 1){
                completeUpdate = true;
            }

        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return completeUpdate;
    }
}
