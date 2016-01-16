<%-- 
    Document   : postParcel
    Created on : 8 Nov, 2015, 4:45:19 PM
    Author     : ultmate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/postingPage.css">
        <link type="text/css" rel="stylesheet" href="css/loggedUserHeader.css">
        <link type="text/css" rel="stylesheet" href="css/navigation.css">
        <link type="text/css" rel="stylesheet" href="css/footer.css">
        <title>Parsys-PostParcel</title>
    </head>
    <body>
        <%@include file="loggedUserHeader.jsp" %>
        <%@include file="navigation.jsp" %>
        <section>
            <div id="postParcelDiv">
                <form method="get" action="PostParcel">
                    <table>
                        <tr>
                            <td colspan="2"><h3>Parcel Details</h3></td>
                        </tr>
                        <tr><label>
                            <td class="fieldDescriptor">Sender</td>
                            <td class="field"><input type="text" name="sender" maxlength="30" required autofocus="on"></td>
                        </label></tr>
                        <tr><label>
                            <td class="fieldDescriptor">Sender Mobile</td>
                            <td class="field"><input type="text" name="senderMobile" minlength="10" maxlength="10" pattern="[0-9]{10}" placeholder="Optional"></td>
                        </label></tr>
                        <tr>
                            <td class="fieldDescriptor">Sent For</td>
                            <td class="field"><input type="text" name="receiver" maxlength="30" required></td>
                        </label></tr>
                        <tr><label>
                            <td class="fieldDescriptor">Rec. Mobile</td>
                            <td class="field"><input type="text" name="recMobile" minlength="10" maxlength="10" pattern="[0-9]{10}" placeholder="Optional"></td>
                        </label></tr>
                        <tr><label>
                            <td class="fieldDescriptor">Description</td>
                            <td class="field"><textarea name="description" placeholder="Optional"></textarea></td>
                        </label></tr>
                        <tr><label>
                            <td colspan="2"><input type="submit" value="Post"></td>
                        </label></tr>
                    </table>
                </form>
            </div>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
