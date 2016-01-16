<%-- 
    Document   : parcelStatus
    Created on : 9 Nov, 2015, 1:22:08 AM
    Author     : ultmate
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/parcelStatus.css">
        <link type="text/css" rel="stylesheet" href="css/loggedUserHeader.css">
        <link type="text/css" rel="stylesheet" href="css/navigation.css">
        <link type="text/css" rel="stylesheet" href="css/footer.css">
        <title>Parsys-Status</title>
    </head>
    <body>
        <%@include file="loggedUserHeader.jsp" %>
        <%@include file="navigation.jsp" %>
        <section>

            <%
                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parsys", "root", "root");
                        Statement stmt = conn.createStatement();) {
                    ResultSet rst = stmt.executeQuery("SELECT * FROM parcel");
                    if (rst.next()) {
            %>
            <table rules="all">
                <tr>
                    <th>Parcel_ID</th>
                    <th>Posted_On</th>
                    <th>Sender</th>
                    <th>SenderMobile</th>
                    <th>Sent_For</th>
                    <th>Rec. Mobile</th>
                    <th>Description</th>
                    <th></th>
                </tr>
                <%
                    do {
                %>
                <tr>
                    <td><%= rst.getString(1)%></td>
                    <td><%= rst.getString(2)%></td>
                    <td><%= rst.getString(3)%></td>
                    <td><%= rst.getString(4)%></td>
                    <td><%= rst.getString(5)%></td>
                    <td><%= rst.getString(6)%></td>
                    <td><%= rst.getString(7)%></td>
                    <td><input type="button" class="recBtn" value="Receive" /></td>
                </tr>
                <%
                    } while (rst.next());
                %>
            </table>
            <%
            } else {
            %>
            <h2 class="info">No Parcels Yet!</h2>
            <%
                    }
                } catch (SQLException sqlExc) {
                    sqlExc.printStackTrace();
                }
            %>

        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
