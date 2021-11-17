package com.example.xyzhotel.beans;

public class review {
    private int review_id;
    private String review_content;
    private float review_starts;
    private String review_user;

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public float getReview_starts() {
        return review_starts;
    }

    public void setReview_starts(float review_starts) {
        this.review_starts = review_starts;
    }

    public String getReview_user() {
        return review_user;
    }

    public void setReview_user(String review_user) {
        this.review_user = review_user;
    }
}
