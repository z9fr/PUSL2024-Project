package com.example.xyzhotel.beans;

import java.util.Date;

public class booking {
    private int booking_id;
    private Date start_date;
    private Date end_date;
    private int booked_by;
    private int room_id;
    private float paymentAmount;
    private boolean isComplete;
    private String reason;


    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public int getBooked_by() {
        return booked_by;
    }

    public void setBooked_by(int booked_by) {
        this.booked_by = booked_by;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public float getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(float paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public boolean isComplete() {
        return isComplete;
    }

    public void isComplete(boolean complte_payment) {
        this.isComplete = complte_payment;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
