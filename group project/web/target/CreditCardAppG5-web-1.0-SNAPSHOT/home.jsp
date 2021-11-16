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
    
    String user_username = request.getParameter("userusername");
    String user_enddate = request.getParameter("userenddate");
    String user_cardnumber = request.getParameter("usercardnumber");
    String user_cvv = request.getParameter("usercvv");
    String user_issuenumber = request.getParameter("userissuenumber");
    
    BankRestClient client = new BankRestClientImpl(url);
    TransactionReplyMessage reply = null;
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
        
        reply = client.transferMoney(fromCard, toCard, amount);
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
       reply = client.transferMoney(toCard, fromCard, amount);
    }
    
%>

<main role="main" class="container">
    <H1>Home</H1>
    <main role="main" class="container">
    <p><%=message %></p>
    <p><%=reply %></p>
    <br>
    <div>
        <form action="./home.jsp" method="POST">  
            <table class="table">
               <tbody>
                  <tr>
                     <td>Name</td>
                     <td><input type="text" name="userusername" value="Name" required></td>
                  </tr>
                  <tr>
                     <td>Credit Card Number</td>
                     <td><input type="text" name="usercardnumber" value="" required></td>
                  </tr>
                  <tr>
                     <td>Expiry Date</td>
                     <td><input type="text" name="userenddate" value="End Date" required></td>
                  </tr>
                  <tr>
                     <td>CVV Code</td>
                     <td><input type="text" name="usercvv" value="CVV" required></td>
                  </tr>
                  <tr>
                     <td>Amount</td>
                     <td><input type="text" name="amount" value="Amount" required></td>
                  </tr>
               </tbody>
            </table>
            <input class="btn ml-2 rounded" type="submit" name="transaction" value="Transfer Money">
            <input class="btn ml-2 rounded" type="submit" name="refundtransaction" value="Refund Money">
        </form>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"></span>
        </div>
        <input type="text" class="form-control" placeholder="BankAccount" aria-label="Username" aria-describedby="basic-addon1" id="code" >
    </div>

    <div class="btn-group-vertical">
        <button name="transaction">Enter a new transaction</button>
        <button name="refundtransaction">Reverse a transaction</button>
        <button>Check Credit card Lunn code</button>
    </div>

    <br>
    <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('code').value = document.getElementById('code').value + '1';">1</button>
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('code').value = document.getElementById('code').value + '2';">2</button>
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('code').value = document.getElementById('code').value + '3';">3</button>
    </div><br>
    <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('code').value = document.getElementById('code').value + '4';">4</button>
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('code').value = document.getElementById('code').value + '5';">5</button>
        <button type="button" class="btn btn-secondary" onclick="document.getElementById('code').value = document.getElementById('code').value + '6';">6</button>
    </div><br>
    <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '7';">7</button>
        <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '8';">8</button>
        <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '9';">9</button>
    </div><br>
    <div class="btn-group btn-group-lg" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-warning" onclick="document.getElementById('code').value = document.getElementById('code').value.slice(0, -1);">Clear</button>
        <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '0';">0</button>
        <button type="button" class="btn btn-success" onclick="">Go</button>
    </div>
</main>



</main>





