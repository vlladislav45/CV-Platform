<%@ page import="bg.tuvarna.cs.domain.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: Vladislav
  Date: 4/7/2020
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="styles/editprofile.css">

    <%--    External Libraries--%>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
</head>
<body>

    <%
        User u = (User) session.getAttribute("user");

        if(u == null) {
            response.sendRedirect("login");
        }
    %>

<h1>Редактиране на профил</h1>

<form action="UserServlet" method="POST">

    <div class="row">
        <div class="col-1 col">
            <label class="lab" for="first_name">Име:</label>
            <input id="first_name" name="first_name" type="text" placeholder="Въведете име"/>

            <label class="lab" for="last_name">Фамилно име</label>
            <input id="last_name" name="last_name" type="text" placeholder="Въведете фамилно име"/>
        </div>

        <div class="col-2 col">
            <label class="lab" for="work">Работа</label>
            <input id="work" name="work" type="text" placeholder="Въведете длъжност (работа)"/>

            <label class="lab" for="describe">Описание</label>
            <textarea name="describe" id="describe" rows="4" maxlength="150" style="resize:none;"></textarea>
        </div>
    </div>

    <h2>Професионални качества</h2>

    <div class="row">
        <div class="col-1 col">
            <label class="lab" for="java">Java</label>
            <select name="java" id="java">
                <option value="0" selected></option>
                <script>
                    let java = $('#java');

                    for(let i = 0; i < 10; i++) {
                        let value = $("<option>");

                        value.attr('value', i+1);
                        value.text(i+1);
                        java.append(value);
                    }
                </script>
            </select>

            <label class="lab" for="html">HTML</label>
            <select name="html" id="html">
                <option value="0" selected></option>
                <script>
                    let html = $('#html');

                    for(let i = 0; i < 10; i++) {
                        let value = $("<option>");

                        value.attr('value', i+1);
                        value.text(i+1);
                        html.append(value);
                    }
                </script>
            </select>
        </div>

        <div class="col-2 col">
            <label class="lab" for="css">CSS</label>
            <select name="css" id="css">
                <option value="0" selected></option>
                <script>
                    let css = $('#css');

                    for(let i = 0; i < 10; i++) {
                        let value = $("<option>");

                        value.attr('value', i+1);
                        value.text(i+1);
                        css.append(value);
                    }
                </script>
            </select>

            <label class="lab" for="javascript">JavaScript</label>
            <select name="javascript" id="javascript">
                <option value="0" selected></option>
                <script>
                    let javascript = $('#javascript');

                    for(let i = 0; i < 10; i++) {
                        let value = $("<option>");

                        value.attr('value', i+1);
                        value.text(i+1);
                        javascript.append(value);
                    }
                </script>
            </select>
        </div>
    </div>

    <h2>Личностни качества</h2>
    <label class="lab" for="communicative">Комуникативност</label>
    <select name="communicative" id="communicative">
        <option value="0" selected></option>
        <script>
            let communicative = $('#communicative');

            for(let i = 0; i < 10; i++) {
                let value = $("<option>");

                value.attr('value', i+1);
                value.text(i+1);
                communicative.append(value);
            }
        </script>
    </select>

    <label class="lab" for="teamwork">Работа в екип</label>
    <select name="teamwork" id="teamwork">
        <option value="0" selected></option>
        <script>
            let teamwork = $('#teamwork');

            for(let i = 0; i < 10; i++) {
                let value = $("<option>");

                value.attr('value', i+1);
                value.text(i+1);
                teamwork.append(value);
            }
        </script>
    </select>

    <label class="lab" for="creativity">Креативност</label>
    <select name="creativity" id="creativity">
        <option value="0" selected></option>
        <script>
            let creativity = $('#creativity');

            for(let i = 0; i < 10; i++) {
                let value = $("<option>");

                value.attr('value', i+1);
                value.text(i+1);
                creativity.append(value);
            }
        </script>
    </select>

    <label class="lab" for="email">Имейл</label>
    <input name="email" id="email" type="email" placeholder="Променете имейл адреса си, ако желаете"/>

    <label class="lab" for="phone">Телефонен номер</label>
    <input name="phone" id="phone" type="text" placeholder="Въведете телефонен номер"/>

    <label class="lab" for="town">Град</label>
    <input name="town" id="town" type="text" placeholder="Въведете местоживеене (град)"/>

    <label class="lab" for="street">Улица</label>
    <input name="street" id="street" type="text" placeholder="Въведете улица"/>

    <input class="submit" name="save" type="submit" value="Запази">

</form>

<footer></footer>

</body>
</html>
