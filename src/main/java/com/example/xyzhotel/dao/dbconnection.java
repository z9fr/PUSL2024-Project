package com.example.xyzhotel.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnection {
    public static Connection getConnectionToDatabase() {
        Connection connection = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");
            // https://dev.mysql.com/downloads/connector/j/
            // install this driver to make it work
            // add the driver from file > project-structure > modules > import the jar file
            System.out.println("stupid driver loaded");

            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/xyzhotel", "newuser", "password");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        if (connection != null) {
            System.out.println("connected");
        }
        return connection;
    }
}
