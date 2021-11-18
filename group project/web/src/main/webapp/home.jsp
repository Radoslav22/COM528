<%-- 
    Document   : content
    Created on : Jan 4, 2020, 11:19:47 AM
    Author     : cgallen
--%>

<
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl" %>
<%@page import="org.solent.com504.oodd.bank.model.client.BankRestClient" %>
<%@page import="org.solent.com504.oodd.bank.model.dto.BankAccount" %>
<%@page import="org.solent.com504.oodd.bank.model.dto.BankTransaction" %>
<%@page import="org.solent.com504.oodd.bank.model.dto.BankTransactionStatus" %>
<%@page import="org.solent.com504.oodd.bank.model.dto.CreditCard" %>
<%@page import="org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.TransactionRequestMessage"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.User" %>
<%@page import="org.apache.logging.log4j.Logger" %>
<%@page import="org.apache.logging.log4j.LogManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();

    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String enddate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.enddate");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String issuenumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber");

    String message = "";
%>
<%
    String user_username = request.getParameter("userusername");
    String user_enddate = request.getParameter("userenddate");
    String user_cardnumber = request.getParameter("usercardnumber");
    String user_cvv = request.getParameter("usercvv");
    String user_issuenumber = request.getParameter("userissuenumber");

    BankRestClient client = new BankRestClientImpl(url);
    TransactionReplyMessage transaction_reply_message = null;
    CreditCard fromCard = null;
    CreditCard toCard = null;

    if (request.getParameter("transaction") != null) {
        message = "Successful Transfer!";

        fromCard = new CreditCard();
        fromCard.setName(user_username);
        fromCard.setEndDate(user_enddate);
        fromCard.setCardnumber(user_cardnumber);
        fromCard.setCvv(user_cvv);
        fromCard.setIssueNumber(user_issuenumber);

        toCard = new CreditCard();
        toCard.setName(username);
        toCard.setEndDate(enddate);
        toCard.setCardnumber(cardnumber);
        toCard.setCvv(cvv);
        toCard.setIssueNumber(issuenumber);

        Double amount = Double.parseDouble(request.getParameter("amount").toString());

        transaction_reply_message = client.transferMoney(fromCard, toCard, amount);
        Logger logger = LogManager.getLogger(BankTransactionStatus.class);
        logger.info("Transaction");

    } else if (request.getParameter("refundtransaction") != null) {
        message = "Successful Refund!";

        fromCard = new CreditCard();
        fromCard.setCardnumber(user_cardnumber);
        fromCard.setCvv(user_cvv);
        fromCard.setEndDate(user_enddate);
        fromCard.setIssueNumber(user_issuenumber);
        fromCard.setName(user_username);

        toCard = new CreditCard();
        toCard.setName(username);
        toCard.setCardnumber(cardnumber);
        toCard.setEndDate(enddate);
        toCard.setCvv(cvv);
        toCard.setIssueNumber(issuenumber);

        double amount = Double.parseDouble(request.getParameter("amount").toString());
        transaction_reply_message = client.transferMoney(toCard, fromCard, amount);
        Logger logger = LogManager.getLogger(BankTransactionStatus.class);
        logger.info("Refund Transaction");
    }


%>


<main role="main" class="container">
<script src="./resources/js/numpad.js" defer></script>
    <H1>Credit Card App G5</H1>
    <main role="main" class="container">
        <%= url%><br>
        <%= transaction_reply_message%>
        <br>
        <div>
            <form action="./home.jsp" method="POST">  
                <table class="table">
                    <tbody>
                        <tr>
                            <td>Name</td>
                            <td><input id="name" type="text" name="userusername" value="Name" ></td>
                            
                        </tr>
                        <tr>
                            <td>Credit Card Number</td>
                            <td><input id="creditcard" type="text" name="usercardnumber" value="" required></td>
                            
                        </tr>
                        <tr>
                            <td>Expiry Date</td>
                            <td><input id="expirydate" type="text" name="userenddate" value="End Date" required></td>
                            
                        </tr>
                        <tr>
                            <td>CVV Code</td>
                            <td><input id="cvv" type="text" name="usercvv" value="CVV" required></td>
                            
                        </tr>
                        <tr>
                            <td>Issue Number</td>
                            <td><input id="issuenumber" type="text" name="userissuenumber" value="Issue Number" required></td>
                            
                        </tr>
                        <tr>
                            <td>Amount</td>
                            <td><input id="amount" type="text" name="amount" value="Amount" required></td>
                            
                        </tr>
                    </tbody>
                </table>
                <input class="btn ml-2 rounded" type="submit" name="transaction" value="Transfer Money">
                <input class="btn ml-2 rounded" type="submit" name="refundtransaction" value="Refund Money">
            </form>
        </div>

        <div class="btn-group-vertical">

            <a href="./checkcard.jsp">Check Credit card Lunn code</a>
        </div>

        <br>
        <div id="numpadcredit">
            <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                <button name="numkeys" type="button" class="btn btn-secondary" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '1';">1</button>
                <button name="numkeys" type="button" class="btn btn-secondary" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '2';">2</button>
                <button name="numkeys" type="button" class="btn btn-secondary" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '3';">3</button>
            </div><br>
            <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '4';">4</button>
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '5';">5</button>
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '6';">6</button>
            </div><br>
            <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '7';">7</button>
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '8';">8</button>
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '9';">9</button>
                <button name="numkeys/" type="button" class="btn ml-2 rounded" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '/';">/</button>
            </div><br>
            <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
                <button name="numkeysclear" type="button" class="btn btn-warning" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value.slice(0, -1);">Clear</button>
                <button name="numkeys" type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('creditcard').value = document.getElementById('creditcard').value + '0';">0</button>
                <button name="numkeysgo" type="button" class="btn btn-success" onclick="">Go</button>
            </div>
        </div>
        
    </main>

</main>





