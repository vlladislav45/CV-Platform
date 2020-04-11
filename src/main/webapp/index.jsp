<%@ page import="bg.tuvarna.cs.domain.entities.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PTI-PROJECT</title>

    <link rel="stylesheet" href="./styles/header.css">
    <link rel="stylesheet" href="./styles/main.css">
    <link rel="stylesheet" href="./styles/footer.css">

    <!--External Libraries-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
</head>
<body>
    <%
        User user;

        if(session.getAttribute("user") == null) {
            user = new User();
        }else {
           user = (User) session.getAttribute("user");
        }
    %>

    <div class="header">
        <% if(session.getAttribute("user") != null) { %>
        <div class="nav-btn">
            <a href="editprofile">Profile</a>
        </div>

        <div class="nav-btn">
            <a href="logout">Logout</a>
        </div>
        <%} else{ %>

        <div class="nav-btn">
            <a href="login">Login</a>
        </div>

        <div class="nav-btn">
            <a href="register">Register</a>
        </div>
        <%} %>
    </div>
    <% if(session.getAttribute("user") != null) { %> Добре дошли, <% out.print(user.getLogin()); %>
    <button id="exit" name="exit">Изключи</button><script type="text/javascript">
        let exit = $("#exit");

        //TODO: request is failed with error code: 500, have to fix it

        exit.on('click', function() {
            $.ajax({
                url: 'UserServlet',
                method: 'post',
                data: 'exit',
                success: alert("Successfully send 'Exit' to URL:")
            });

        });
    </script>
    <% } %>

    <div class="wrapper">
        <div class="shell">
            <div class="main">
                <img class="profile-pic" src="./images/male.svg" width="30%" height="355">

                <div class="profile-pic-text">
                    <h2>Профилна информация</h2>

                    <p>Име: <%
                        assert user != null;
                        if(user.getFirstName() != null && user.getLastName() != null) {
                        out.print(user.getFirstName() + " " + user.getLastName());
                    } %> <br><br>
                        Работа: <% if(user.getWork() != null) out.print(user.getWork()); %> <br><br>

                        Описание: <% if(user.getDescribe() != null) {
                                StringBuffer str = new StringBuffer(user.getDescribe());
                                final int indexOfCut = 50;

                                if(user.getDescribe().length() > indexOfCut)
                                str.insert(indexOfCut, "<br>"); // insert at the n position new line

                                if(user.getDescribe().length() > indexOfCut*2+20)
                                str.insert(indexOfCut*2+20, "<br>");

                                out.print(str);
                        }%>
                    </p>
                </div>
            </div>

            <div class="skills">
                <h2>Умения</h2>

                <div class="body-main">
                    <div class="left-body">
                        <h3>Професионални</h3>

                        <div class="skill">
                            <p>Java</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getJava()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>HTML</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getHtml()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>CSS</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getCss()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>JavaScript</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getJavascript()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>

                    <div class="right-body">
                        <h3>Личностни</h3>

                        <div class="skill">
                            <p>Комуникативност</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getCommunicative()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>Екипна работа</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getTeamwork()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>Креативност</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= user.getTeamwork()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="body-down">
                <h2>Контакти</h2>
                <div class="contacts">
                    <div class="left-down-bar">
                        <p>Имейл</p>

                        <p><a href="#"><% if(user.getEmail() != null) out.print(user.getEmail()); %></a></p>

                        <p>Телефон</p>

                        <p><a href="#"><% if(user.getPhoneNumber() != null) out.print(user.getPhoneNumber()); %></a></p>
                    </div>

                    <div class="right-down-bar">
                        <p>Град</p>

                        <p><% if(user.getTown() != null) out.print(user.getTown()); %></p>

                        <p>Улица</p>

                        <p><% if(user.getStreet() != null) out.print(user.getStreet()); %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer></footer>

</body>
</html>