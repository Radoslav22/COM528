# READ ME COM528
The developers and contributors involved in this project were:

Radoslav Takvoryan

Rikin

Nikiten

Muhammed Abdullah

# Using the app
When the application is running you can access the project [here](http://localhost:8080/). 
You can navigate the app by using the keypad on the screen or you can also 
the mouse and keyboard on the device you are running the program. 
The application runs on google chrome and internet explorer. 
It also should run on other browsers however it was not tested on 
them as a result it may cause an error. 
# Properties
 - When the program is running the properties below will be in place which must be filled. 
 - User name – This is the name on the card that the user must fill out.
 - User card number – This is the Card number that the user must fill out.
 - User issue number- The issue number that the bank issues once the card details are filled out.
 - User end date –  Cards end date that must be filled out.

# System Requirements
The system requirements for this application is:
 - A working PC with windows 10 
 - Java JDK version 8 or newer.
 - Apache Maven 3.8 or newer
 - Apache Tomcat 9
 - Google chrome or internet explorer 

# Features
The program contains many features such as:
- The app has pin pad where they can use to fill the forms in 
- The  App has buttons which allows the  user to send, return or check credit card
- It contains a credit card algorithm validator
# Use cases 



| procedure | Action | Response|
|------|--------|---------|
| 1 | Enter app URL into the browser | Directs user to home page | 
| 2 | User can choose if they want to send, refund or check credit card|  application will change to the appropriate request |
| 3 | If User enteres the correct card infor | Application checks if the card details are correct and vlaidates it |
| 4 | User fails to enter card details | An error message is displayed |
| 5 | User enters the wrong details | An error message is displayed |

## Admin point of view

|Admin | Action | Response|
|------|--------|---------|
| procedure 1 | Admin tries to configure |  Enters correct details and can configure the properties|
| procedure 2 | Admin views transactions of user | Transactions are viewed using a LogRecord |
| procedure 3 | Admin enters application | it will recognises the details |



