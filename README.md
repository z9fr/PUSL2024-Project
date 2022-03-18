# Project

### Project Screenshot

![homepage](content/img/projscreenshot.png)



### Requirements

- [x] online reservations
- [x] avoid booking collisions
- [x] visualization of customer feedback for management
- [x] Email notification of reservation and cancelling options
- [x] SMS notification of reservation and cancelling options
- [x] payment handling
- [x] Email Verification when sign up
- [x] Background Jobs to Clean up the Tokens
- [x] Admins can add rooms from the backend 
- [x] Background Job to check Reservations ( sending mails to daily orders )
- [x] Password Hashing MD5

### Project Structure

```
.
├── pom.xml
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── xyzhotel
│   │   │               ├── beans
│   │   │               │   ├── review.java
│   │   │               │   └── room.java
│   │   │               ├── dao
│   │   │               │   ├── ApplicationDao.java
│   │   │               │   ├── dbconnection.java
│   │   │               │   └── homeInfo.java
│   │   │               ├── HelloServlet.java
│   │   │               └── servletz
│   │   │                   ├── allRooms.java
│   │   │                   ├── home.java
│   │   │                   └── login.java
│   │   ├── resources
│   │   └── webapp
│   │       ├── css
│   │       │   └── custom.css
│   │       ├── index.html
│   │       ├── jsp
│   │       │   ├── login.jsp
│   │       │   ├── partials
│   │       │   │   ├── footer.jsp
│   │       │   │   └── navbar.jsp
│   │       │   ├── rooms.jsp
│   │       │   └── thehomepage.jsp
│   │       ├── static
│   │       │   └── img
│   │       │       └── hero.webp
│   │       └── WEB-INF
│   │           ├── lib
│   │           │   └── mysql-connector-java-8.0.27.jar
│   │           └── web.xml
│
└── xyzhotel.iml
```


### Database Structure

```sql

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
    paymentAmount Double  NOT NULL,
    complte_payment bool,
    reason varchar(256),
    PRIMARY KEY (booking_id),
    FOREIGN KEY (room_id) REFERENCES room_info(room_id),
    FOREIGN KEY (booked_by) REFERENCES users(uuid)
);


ALTER TABLE bookings MODIFY COLUMN booking_id INT auto_increment;
ALTER TABLE bookings MODIFY COLUMN complte_payment bool;


INSERT into bookings(start_date,end_date,booked_by,room_id,paymentAmount,complte_payment,reason) VALUES("2021-12-10","2021-12-23",2,5,100,true,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut earum maxime quas voluptatibus quia necessitatibus vel praesentium expedita magni laborum?')



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


ALTER TABLE users MODIFY COLUMN uuid INT auto_increment;



-- create reviews table
CREATE TABLE reviews(
    review_id int,  
    review_content varchar(255) NOT NULL, 
    review_starts int,
    review_user VARCHAR(255) NOT NULL,
    PRIMARY KEY(review_id) 
);


ALTER TABLE reviews MODIFY COLUMN review_id INT auto_increment;


CREATE TABLE quotes
(
  quote_id int,
  msg varchar(255) NOT NULL,
  PRIMARY KEY(quote_id)
);

ALTER TABLE quotes MODIFY COLUMN quote_id INT auto_increment;


insert into quotes(msg) values('“It’s been my experience that you can nearly always enjoy things if you make up your mind firmly that you will.” —L.M. Montgomery');


-- example change for reviews
INSERT INTO reviews(review_content,review_starts,review_user) values(" Really helpful staff, good location (8 mins to airport express), very clean. ", 4, "Lorem, ipsum. ");





-- getting the last three columns from room table for home page
SELECT * FROM room_info WHERE room_id <= (SELECT max(room_id) FROM room_info) LIMIT 3;



SELECT * FROM reviews WHERE review_id <= (SELECT max(review_id) FROM room_info) LIMIT 5;

SELECT msg FROM quotes ORDER BY RAND() LIMIT 1;


ALTER TABLE users ADD isVerified boolean DEFAULT False;
    
ALTER TABLE users ADD verificationid int;


CREATE TABLE verfication_token(
    verificationid int auto_increment NOT NULL,
    token varchar(256),
    isvalid boolean,
    PRIMARY key(verificationid)
);

ALTER TABLE verfication_token MODIFY COLUMN verificationid VARCHAR(256);

ALTER TABLE users MODIFY COLUMN verificationid VARCHAR(256);


ALTER TABLE users MODIFY COLUMN uuid VARCHAR(256);


ALTER TABLE bookings ADD pay_id VARCHAR(256);

ALTER TABLE bookings ADD isVerified boolean;

-- creating booking reminders table 

create table booking_reminders ( remind_id int,start_date varchar(256),  end_date varchar(256),  isDone boolean);

alter table booking_reminders add PRIMARY key(remind_id);
alter table booking_reminders MODIFY COLUMN remind_id int auto_increment;


-- adding phone number

table users add column phoneNumber varchar(256);
```
