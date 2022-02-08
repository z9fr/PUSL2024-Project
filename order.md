# the order we need to talk  

- feedback ( how its renderd on the frontend )
- rooms ( front end how its rendr from jsp ) 
- sign up
- mail verification
- login 
- filters ( filter to check auth )
- user roles 
- user dashboard ( bookings ) 
  - showing the quotes ( every time user login )
- showing the orders 
- adding a feedback 
- booking process
- checking if the room is already booked
- avoid booking collistions
- paypal payment handelling
- sending confirmation emails 

- admin dashboard
- visualizing customer feedback
- displaying ongoing orders 
- display reviews 

- sending reminder sms
- background jobs to clean up the tokens


---

## Feedback Frontend 

visualizing customer feedback. in the home page of the application we are displaying the customer feedback 
as cards latest 5 reviews will display on cards in the home page for the users to se. 
these reviws can also be shared, and the number of stars they are rating will also display here 

in the home srvlet we are getting these top reviews and so and so and addng them to a request attribute to display on the frontend


----

# displaying the rooms

just lik th feedback there's top 3 ( newly added ) rooms will display on the hompage, these will also retriew a arraylist from the 
home servlet and seting that as a request attribute then looping it using jsp 


----

## showing the quotes

when ever user login to the account he will be welcomed with a quote that comes from the database and display on the application
using jsp.

this happens every time user login / refresh the page

--------


