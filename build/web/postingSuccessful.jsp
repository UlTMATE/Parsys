<%-- 
    Document   : postingSuccessful
    Created on : 9 Nov, 2015, 6:41:58 PM
    Author     : ultmate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/postingSuccessful.css">
        <link type="text/css" rel="stylesheet" href="css/loggedUserHeader.css">
        <link type="text/css" rel="stylesheet" href="css/navigation.css">
        <link type="text/css" rel="stylesheet" href="css/footer.css">
        <title>Parsys-Status</title>
    </head>
    <body>
        <%@include file="loggedUserHeader.jsp" %>
        <%@include file="navigation.jsp" %>
        <section>
            <table>
                <tr>
                    <td colspan="2"><h2>Parcel Successfully Posted</h2></td>
                </tr>
                <tr>
                    <td><input type="button" value="Post Another" onclick="location.href='postingPage.jsp'"/></td>
                    <td><input type="button" value="View Posts" onclick="location.href='parcelStatus.jsp'"/></td>
                </tr>
            </table>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>