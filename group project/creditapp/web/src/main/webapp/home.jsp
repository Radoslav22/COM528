<%-- 
    Document   : content
    Created on : Jan 4, 2020, 11:19:47 AM
    Author     : cgallen
--%>

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page import="org.solent" %>
<%@page import="org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();

    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String cardnumber = propertiesDao.getProperty("org.solent.oodd.simplepropertiesdaowebapp.url");
    String cvv = propertiesDao.getProperty("org.solent.oodd.simplepropertiesdaowebapp.url");
    String expirydate = propertiesDao.getProperty("org.solent.oodd.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String message = "";
    
    String user_cardnumber = request.getParameter("usercardnumber");
    String user_cvv = request.getParameter("usercvv");
    String user_expirydate = request.getParameter("userexpirydate");
    String user_username = request.getParameter("userusername");
    

    TransactionReplyMessage reply = null;
    
%>

<!-- Begin page content -->
<main role="main" class="container">
    <H1>Home</H1>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"></span>
        </div>
        <input type="text" class="form-control" placeholder="BankAccount" aria-label="Username" aria-describedby="basic-addon1" id="code" >
    </div>

    <div class="btn-group-vertical">
        <button>Enter a new transaction</button>
        <button>Reverse a transaction</button>
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





