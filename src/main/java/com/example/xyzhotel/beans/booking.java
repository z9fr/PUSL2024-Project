package com.example.xyzhotel.beans;

import java.util.Date;

public class booking {
    private int booking_id;
    private Date start_date;
    private Date end_date;
    private int booked_by;
    private int room_id;
    private Double paymentAmount;
    private boolean complte_payment;
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

    public Double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public boolean isComplte_payment() {
        return complte_payment;
    }

    public void setComplte_payment(boolean complte_payment) {
        this.complte_payment = complte_payment;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
