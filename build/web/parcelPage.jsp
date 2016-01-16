<%-- 
    Document   : parcelPage
    Created on : 8 Nov, 2015, 1:01:31 AM
    Author     : ultmate
--%>

<%@page import="java.sql.*, model.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String userid = (String)session.getAttribute("userid");
            if(Database.isUserMale(userid)) {
        %>
        <link type="text/css" rel="stylesheet" href="css/parcelPageMale.css">
        <%
            } else {
        %>
        <link type="text/css" rel="stylesheet" href="css/parcelPageFemale.css">
        <%      }
        %>
        <link type="text/css" rel="stylesheet" href="css/loggedUserHeader.css">
        <link type="text/css" rel="stylesheet" href="css/footer.css">
        <title>Parsys-Status</title>
    </head>
    <body>
        <%@include file="loggedUserHeader.jsp" %>
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
