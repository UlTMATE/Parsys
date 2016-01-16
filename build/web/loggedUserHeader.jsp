<%-- 
    Document   : loggedUserHeader
    Created on : 8 Nov, 2015, 4:48:08 PM
    Author     : ultmate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function logout() {
        document.location.href = 'Logout';
    }
</script>
<header>
    <div id="headerRootDiv">
        <div id="headerLogoDiv">
            <img src="images/Logo-LNMIIT-black.png" alt="logo" height="30px" />
        </div>
        <div id="headerTitleDiv">
            <h1 id="headerTitle">PARSYS</h1>
        </div>
        <div id="logoutDiv">
            <button id="logoutBtn" onclick="logout()">Logout</button>
        </div>
    </div>
</header>
