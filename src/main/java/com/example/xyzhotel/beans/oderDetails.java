package com.example.xyzhotel.beans;

public class oderDetails {
    private String start_date;
    private String end_date;
    private String reason;
    private int room_id;
    private String room_price;
    private String username;
    private int user_id;

    public oderDetails(String start_date, String end_date, String reason, int room_id, String room_price, String username, int user_id)
    {
        this.end_date = end_date;
        this.start_date = start_date;
        this.reason = reason;
        this.room_id = room_id;
        this.room_price = room_price;
        this.username =username;
        this.user_id = user_id;
    }


    public String getStart_date() {
        return start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public String getReason() {
        return reason;
    }


    public int getRoom_id() {
        return room_id;
    }


    public String getRoom_price() {
        return room_price;
    }



    public String getUsername() {
        return username;
    }

    public int getUser_id() {
        return user_id;
    }

}
