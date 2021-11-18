package com.example.xyzhotel.dao;

import com.example.xyzhotel.beans.booking;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class getBookings {

    public List<booking> getBookings(int userid){

        System.out.println("[+] User Requested for Bookings id="+userid);

        booking booking = null;
        List<booking> bookings = new ArrayList<>();

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            String sql = "select * from bookings where booked_by=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(userid));

            ResultSet set = statement.executeQuery();

            while (set.next()) {
                booking = new booking();
                booking.setBooking_id(set.getInt("booking_id"));
                booking.setStart_date(set.getDate("start_date"));
                booking.setEnd_date(set.getDate("end_date"));
                booking.setBooked_by(set.getInt("booked_by"));
                booking.setRoom_id(set.getInt("room_id"));
                booking.setPaymentAmount(set.getDouble("paymentAmount"));
                booking.setComplte_payment(set.getBoolean("complte_payment"));
                booking.setReason(set.getString("reason"));
                bookings.add(booking);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return bookings;

    }

    public List<booking> bookingInfo(int bookingid, int uuid){

        System.out.println("[+] User Requested for Bookings id="+uuid);

        booking booking = null;
        List<booking> bookings = new ArrayList<>();

        try{
            // select role from users where uname='admin' and password='password';
            Connection connection = dbconnection.getConnectionToDatabase();
            // checking both booked and booking which will prevent unauth users viewing orders
            String sql = "select * from bookings where booking_id=? AND booked_by=?";

            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, String.valueOf(bookingid));
            statement.setString(2, String.valueOf(uuid));

            ResultSet set = statement.executeQuery();

            while (set.next()) {
                booking = new booking();
                booking.setBooking_id(set.getInt("booking_id"));
                booking.setStart_date(set.getDate("start_date"));
                booking.setEnd_date(set.getDate("end_date"));
                booking.setBooked_by(set.getInt("booked_by"));
                booking.setRoom_id(set.getInt("room_id"));
                booking.setPaymentAmount(set.getDouble("paymentAmount"));
                booking.setComplte_payment(set.getBoolean("complte_payment"));
                booking.setReason(set.getString("reason"));
                bookings.add(booking);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return bookings;

    }
}
