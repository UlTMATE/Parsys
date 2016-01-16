<%-- 
    Document   : index
    Created on : 8 Nov, 2015, 12:59:43 AM
    Author     : ultmate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.sql.*, model.Database"%>

<%!
    public void init() {
        new Database();
    }
%>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <title>Parsys Login</title>
    </head>

    <body>
        <header>
            <div id="headerRootDiv">
                <div id="headerLogoDiv">
                    <img src="images/Logo-LNMIIT-black.png" alt="logo"/>
                </div>
                <div id="headerTitleDiv">
                    <h1 id="headerTitle">PARSYS</h1>
                </div>
            </div>
        </header>

        <section>
            <div id="loginDiv">
                <form name="loginForm" method="POST" action="Login">
                    <table>
                        <tr>
                            <td colspan="2" id="loginDivTitle"><img src="images/profile1.png" alt="ProfileImage"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="errorMsg">
                                <%
                                    Object errMsg = request.getAttribute("errorMsg");
                                    if(errMsg != null) {
                                        out.println(errMsg);
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldDescription">Roll No.</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" name="studentId" placeholder="Roll No." maxlength="8"
                                                   class="field" autocomplete="on" autofocus required/></td>
                        </tr>
                        <tr>
                            <td class="fieldDescription">Password</td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="password" name="pwd" placeholder="Password" 
                                                   class="field" required/></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td class="linkText"><a href="/Signup">Create Account</a></td>
                            <td class="linkText"><a href="/ForgotPassword">Forgot Password</a></td>
                        </tr>

                        <tr>
                            <td colspan="2"><input type="submit" value="Login" class="btn"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>

        <footer>
            <div id="footerRootDiv">
                <h4 id="footerText">Developed By Group 26</h4>
            </div>
        </footer>
    </body>
</html>
