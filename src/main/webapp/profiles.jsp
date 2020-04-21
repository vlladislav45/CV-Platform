<%@ page import="bg.tu_varna.cs.domain.entities.UserSource" %>
<%@ page import="bg.tu_varna.cs.domain.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: Vladislav
  Date: 4/13/2020
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile page</title>

    <link rel="stylesheet" href="styles/profiles.css">
</head>
<body>

    <div class="header">
        <% if(session.getAttribute("user") != null) { %>
        <div class="nav-btn">
            <a href="logout">Излизане</a>
        </div>

        <div class="nav-btn">
            <a href="profiles">Профили</a>
        </div>

        <div class="nav-btn">
            <a href="index">Назад</a>
        </div>
        <%} else{ %>

        <div class="nav-btn">
            <a href="login">Вход</a>
        </div>

        <div class="nav-btn">
            <a href="register">Регистрация</a>
        </div>

        <div class="nav-btn">
            <a href="profiles">Профили</a>
        </div>
        <%} %>
    </div>

    <div class="main">
        <table cellspacing="1">
            <tr class="main-row">
                <td class="main-col main-col-1">Потребител</td>
                <td class="main-col main-col-2">Работа</td>
                <td class="main-col">Информация</td>
            </tr>

            <%
                ServletContext ctx = request.getServletContext();
                UserSource users = (UserSource) ctx.getAttribute("users");

                final String URL = "index";

                for(User u : users.getUsers()) {
                    out.print("<tr class='row'>");
                    out.print("<td class='col'><a href='"+ URL + "?user=" + u.getId() + "'>" + u.getFirstName() + " " + u.getLastName() + "</a></td>");
                    out.print("<td class='col'>" + u.getWork() + "</td>");
                    out.print("<td class='col col-3'>" + u.getDescribe() + "</td>");
                    out.print("</tr>");
                }
            %>

        </table>
    </div>

</body>
</html>
