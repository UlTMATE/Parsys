<%-- 
    Document   : errorPage
    Created on : 9 Nov, 2015, 7:19:59 PM
    Author     : ultmate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/errorPage.css">
        <link type="text/css" rel="stylesheet" href="css/loggedUserHeader.css">
        <link type="text/css" rel="stylesheet" href="css/navigation.css">
        <link type="text/css" rel="stylesheet" href="css/footer.css">
        <title>Parsys-Error</title>
    </head>
    <body>
        <%@include file="loggedUserHeader.jsp" %>
        <%@include file="navigation.jsp" %>
        <section>
            <h3>An Error Occured</h3>
            <a href="postingPage.jsp" id="tryAgain">Try Again!</a>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
