<%-- 
    Document   : content
    Created on : Jan 4, 2020, 11:19:47 AM
    Author     : cgallen
--%>

<%@ page import="java.util.*,java.lang.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage", "home");

%>
<jsp:include page="header.jsp" />
<!-- Begin page content -->
<main role="main" class="container">
    <H1>Home</H1>

    <div class="btn-group-vertical ml-4 mt-4" role="group" aria-label="Basic example">
        <div class="btn-group">
            <input class="text-center form-control-lg mb-2" id="code">
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '1';">1</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '2';">2</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '3';">3</button>
        </div><br>
        <div class="btn-group">
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '4';">4</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '5';">5</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '6';">6</button>
        </div><br>
        <div class="btn-group">
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '7';">7</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '8';">8</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '9';">9</button>
        </div><br>
        <div class="btn-group">
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value.slice(0, -1);">Clear</button>
            <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value = document.getElementById('code').value + '0';">0</button>
            <button type="button" class="btn btn-primary py-3" onclick="">Go</button>
        </div><br>
    </div>

</main>




<jsp:include page="footer.jsp" />
