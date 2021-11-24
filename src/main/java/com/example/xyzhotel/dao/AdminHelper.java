package com.example.xyzhotel.dao;

import com.example.xyzhotel.beans.review;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminHelper {
    public int UserCount(){
        int count = 0;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select count(*) from users;";

            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()){
                count = set.getInt("count(*)");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return count;
    }

    public int TotalBookings(){
        int count = 0;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select count(*) from bookings;";

            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()){
                count = set.getInt("count(*)");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return count;
    }

    public int roomCount(){
        int count = 0;

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select count(*) from room_info;";

            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()){
                count = set.getInt("count(*)");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return count;
    }

    public List<review> getAllReviews(){
        review review = null;
        List<review> reviews = new ArrayList<>();

        try{
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "SELECT * FROM reviews;";
            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(sql);

            while (set.next()) {
                review = new review();
                review.setReview_id(set.getInt("review_id"));
                review.setReview_content(set.getString("review_content"));
                review.setReview_starts(set.getInt("review_starts"));
                review.setReview_user(set.getString("review_user"));
                reviews.add(review);
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }
        return reviews;

    }
}
