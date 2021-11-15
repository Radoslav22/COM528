<%-- 
    Document   : propertiesExampleJsp
    Created on : 27 Oct 2021, 01:41:23
    Author     : cgallen
--%>

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();

    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String cardnumber = propertiesDao.getProperty("org.solent.oodd.simplepropertiesdaowebapp.url");
    String cvv = propertiesDao.getProperty("org.solent.oodd.simplepropertiesdaowebapp.url");
    String expirydate = propertiesDao.getProperty("org.solent.oodd.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String message = "";
    
    
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "updating properties";
        url = (String) request.getParameter("url");
        username = (String) request.getParameter("username");
        cardnumber = (String) request.getParameter("cardnumber");
        cvv = (String) request.getParameter("cvv");
        expirydate = (String) request.getParameter("expirydate");

        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.url", url);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.username", username);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber", cardnumber);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cvv", cvv);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate", expirydate);
        
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Properties Example Jsp</title>
    </head>
    <body>
        <h1>Properties Example Jsp</h1>
        <p><%=message %></p>
        <form action="./home.jsp" method="POST">
            <p>Bank URL <input type="text" name="url" value="<%=url%>"></p>
            <p>Username <input type="text" name="username" value="<%=username%>"></p>
            <p>Account Number <input type="text" name="cardnumber" value="<%=cardnumber%>"></p>
            <p>CVV <input type="text" name="cvv" value="<%=cvv%>"></p>
            <p>Expiry Date <input type="text" name="expirydate" value="<%=expirydate%>"></p>
            <input type="hidden" name="action" value="updateProperties">

            <button class="btn" type="submit" >Update Properties</button>
        </form> 
    </body>
</html>
