# READ ME COM528
The developers and contributors involved in this project were:

Radoslav Takvoryan

Rikin

Nikiten

Muhammed Abdullah

# Using the app
When the application is running you can access the project [here](http://localhost:8080/). 
You can navigate the app by using the
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
| 3 | If User enteres the correct card info| Application checks if the card details are correct and vlaidates it |
| 4 | User fails to enter card details | An error message is displayed |
| 5 | User enters the wrong details | An error message is displayed |

## Admin point of view

|Admin | Action | Response|
|------|--------|---------|
| procedure 1 | Admin tries to configure |  Enters correct details and can configure the properties|
| procedure 2 | Admin views transactions of user | Transactions are viewed using a LogRecord |
| procedure 3 | Admin enters application | it will recognises the details |






# Test Plan 

| Test num  | Action                                                                                            |  Reaction                                                                                                                                   | Status |
| --------- | ------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| T1       | User enters in the url for the  application.                | If the server is running it will be redirected to a home page , if not you will either get a 404 error | Pass|
| T2     | If the user doesn't fill in all the fields a popup will show telling them this field is required.     | Required field is shown to the user when attempting to submit .                                                                               | Pass |
| T3     | submits a transaction request, with invalid details.                                    | request is rejected leaving an error message.                                                 | fail |
| T4     | A transaction request and has funds for this to go through.     |   notified with details of where it went.                                                                                     | Pass |
| T5     | A transaction is request and does not have the funds. | The transaction fails, with the user told  that the account does not have enough funds .                                 | Pass|
| T6     | submits a refund request and does have the funds to over this request. | The transaction passes with the user being messaged .                       | fail |
| T7     | A Invalid credit card number for the Lunn code check | This fails with the user being notified                        | Pass |
| T8     | Valid credit card number for the Lunn code check | This passes with the user being notified of the card type.                       | Pass |
| T9     | User uses pinpad buttons | The button pressed will enter the value .          | fail|
| T10     | User uses select button. | The button pressed will change the input . | fail |


