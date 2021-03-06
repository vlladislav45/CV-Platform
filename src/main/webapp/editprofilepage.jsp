<%@ page import="bg.tu_varna.cs.domain.entities.User" %><%--
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
    <div class="header">
        <% if(session.getAttribute("user") != null) {
            final String URL = "index";
        %>
        <div class="nav-btn">
            <%out.print("<a href='"+ URL + "?user=" + u.getId() + "'>");%> Преглед  <% out.print("</a>"); %>
        </div>

        <div class="nav-btn">
            <a href="logout">Излизане</a>
        </div>

        <div class="nav-btn">
            <a href="profiles">Профили</a>
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

<h1>Редактиране на профил</h1>

<form action="profile_info" method="POST">

    <h2>Профилна информация</h2>

    <input class="submit" name="profileInfo" type="submit" value="Запази">

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
</form>

    <form action="profile_skills" method="post">

    <h2>Професионални качества</h2>

    <input class="submit" name="profileSkills" type="submit" value="Запази">

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
</form>


<form action="profile_additional_info" method="post">

    <h2>Контакти</h2>

    <input class="submit" name="profileAdditionalInfo" type="submit" value="Запази">

    <label class="lab" for="email">Имейл</label>
    <input name="email" id="email" type="email" placeholder="Променете имейл адреса си, ако желаете"/>

    <label class="lab" for="phone">Телефонен номер</label>
    <input name="phone" id="phone" type="text" placeholder="Въведете телефонен номер"/>

    <label class="lab" for="town">Град</label>
    <input name="town" id="town" type="text" placeholder="Въведете местоживеене (град)"/>

    <label class="lab" for="street">Улица</label>
    <input name="street" id="street" type="text" placeholder="Въведете улица"/>

</form>

    <script type="text/javascript">
        document.addEventListener('submit', e => {

            // Store reference to form to make later code easier to read
            const form = e.target;
            console.log(form);

            // Post data using the Fetch API
            fetch(form.action, {
                method: form.method,
                mode: 'cors',
                cache: 'no-cache',
                credentials: 'same-origin',
                body: new FormData(JSON.stringify(form))
            })

            // Prevent the default form submit
            e.preventDefault();
        });
    </script>

<footer></footer>

</body>
</html>
