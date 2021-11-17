package com.example.xyzhotel.beans;

public class room {
    private int room_id;
    private String title;
    private String room_description;
    private String room_image;

    // room_id getters and setters
    public int getRoom_id(){
        return this.room_id;
    }

    public void setRoom_id(int room_id){
        this.room_id = room_id;
    }

    // title getters and setters

    public String getTitle(){
        return this.title;
    }

    public void setTitle(String title){
        this.title = title;
    }

    // roomDescription getters and setters

    public String getRoom_description(){
        return this.room_description;
    }

    public void setRoom_description(String room_description){
        this.room_description = room_description;
    }

    // roomImage getters and setters
    public String getRoom_image() {
        return room_image;
    }

    public void setRoom_image(String room_image) {
        this.room_image = room_image;
    }
}
