package com.example.xyzhotel.dao.user;

import com.example.xyzhotel.dao.dbconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class randomQuote {
    public String getQuote(){

        String quote = "";

        try{
            Connection con = dbconnection.getConnectionToDatabase();
            String query = "SELECT msg FROM quotes ORDER BY RAND() LIMIT 1;";

            java.sql.PreparedStatement statement = con.prepareStatement(query);
            ResultSet set = statement.executeQuery();

            while (set.next()) {
                quote = set.getString("msg");
            }
        }
        catch (SQLException exception) {
            exception.printStackTrace();
        }

        return quote;
    }
}
