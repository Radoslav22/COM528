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
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String enddate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.enddate");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String issuenumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber");
    
    String message = "";
    
    
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "updating properties";
        url = (String) request.getParameter("url");
        username = (String) request.getParameter("username");
        enddate = (String) request.getParameter("enddate");
        cardnumber = (String) request.getParameter("cardnumber");
        cvv = (String) request.getParameter("cvv");
        issuenumber = (String) request.getParameter("issuenumber");
        

        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.url", url);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.username", username);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.enddate", enddate);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber", cardnumber);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cvv", cvv);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber", issuenumber);
        
        
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Properties Example Jsp</title>
    </head>
    <body>
        <h1>Credit Card App G5</h1>
        <h2>Please update the properties!</h2>
        <p><%=message %></p>
        
            <p>Bank URL <input type="text" name="url" value="<%=url%>" required></p>
            <p>Username <input type="text" name="username" value="<%=username%>"required></p>
            <p>Expiry Date <input type="text" name="enddate" value="<%=enddate%>" required></p>
            <p>Card Number <input type="text" name="cardnumber" value="<%=cardnumber%>" required></p>
            <p>CVV<input type="text" name="cvv" value="<%=cvv%>" required></p>
            <p>Issue Number<input type="text" name="issuenumber" value="<%=issuenumber%>" required></p>
            <input type="hidden" name="action" value="updateProperties">

            <button class="btn" type="submit"  method="POST" >Update Properties</button><br>
            <form action="./home.jsp"> 
                <button>Go to home Page</button>
            </form> 
            <%= url %>
        
    </body>
</html>
