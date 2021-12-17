package com.example.xyzhotel.beans;

public class EventsToday {
    private int remind_id;
    private String start_date;
    private String end_date;
    private Boolean isDone;
    private int booking_id;

    public int getRemind_id() {
        return remind_id;
    }

    public void setRemind_id(int remind_id) {
        this.remind_id = remind_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public Boolean getDone() {
        return isDone;
    }

    public void setDone(Boolean done) {
        isDone = done;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }
}
