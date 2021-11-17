-- create database

CREATE DATABASE xyzhotel;


USE xyzhotel;

-- creating bookings table

CREATE TABLE bookings (
    booking_id int NOT NULL ,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    booked_by INt  NOT NULL,
    room_id INT  NOT NULL,
    paymentAmount float  NOT NULL,
    ispayment_done bool  NOT NULL,
    reason varchar(256),
    PRIMARY KEY (booking_id),
    FOREIGN KEY (room_id) REFERENCES room_info(room_id),
    FOREIGN KEY (booked_by) REFERENCES users(uuid)
);



-- create table rooms

CREATE TABLE room_info (
    room_id int NOT NULL,
    title varchar(256) NOT NULL,
    room_description varchar(256) NOT NULL,
    room_image varchar(256) NOT NULL,
    PRIMARY KEY (room_id)
);


ALTER TABLE room_info MODIFY COLUMN room_id INT auto_increment;


-- users table

CREATE TABLE users
(
  uuid int,
  email varchar(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role varchar(255) DEFAULT 'user' ,
  PRIMARY KEY(uuid)
);


-- create reviews table
CREATE TABLE reviews(
    review_id int,
    review_content varchar(255) NOT NULL,
    review_starts int,
    review_user VARCHAR(255) NOT NULL,
    PRIMARY KEY(review_id)
);


ALTER TABLE reviews MODIFY COLUMN review_id INT auto_increment;


-- example change for reviews
INSERT INTO reviews(review_content,review_starts,review_user) values(" Really helpful staff, good location (8 mins to airport express), very clean. ", 4, "Lorem, ipsum. ");





-- getting the last three columns from room table for home page
SELECT * FROM room_info WHERE room_id <= (SELECT max(room_id) FROM room_info) LIMIT 3;



SELECT * FROM reviews WHERE review_id <= (SELECT max(review_id) FROM room_info) LIMIT 5;