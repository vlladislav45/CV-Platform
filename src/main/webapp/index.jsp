<%@ page import="bg.tu_varna.cs.domain.entities.User" %>
<%@ page import="bg.tu_varna.cs.domain.entities.UserSource" %>
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

        User userByID;
        if(request.getParameter("user") != null) {
            int id = Integer.parseInt(request.getParameter("user"));

            ServletContext ctx = request.getServletContext();
            UserSource users = (UserSource) ctx.getAttribute("users");
            userByID = users.getById(id);
        }else {
            userByID = new User();
        }
    %>

    <div class="header">
        <% if(session.getAttribute("user") != null) { %>
        <div class="nav-btn">
            <a href="editprofile">Редактиране на профил</a>
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
    <%
        if(session.getAttribute("user") != null && user.getId() == userByID.getId()) { %>
    <div class="title">Добре дошъл, <% out.print(user.getLogin()); %></div>
    <button id="exit" name="exit" class="exit">Изключи</button>
    <%
        boolean isTrue = false;
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if ((cookie.getName()).compareTo("exit") == 0) {
                    out.println("<div class='title'>" + cookie.getValue() + " expired in 24 hours " + "</div><br/>");
                    isTrue = true;
                }
            }
            if(isTrue) {
                 %>
                <script>
                    $('#exit').css("display", "none");
                </script>
                <%
            }else {
                %>
                <script>
                    $('#exit').css("display", "block");
                </script>
                <%
            }
        }
    }
    %>
    <script type="text/javascript">
        let exit = $("#exit");

        exit.on('click', function() {
            $.ajax({
                url: 'cookie',
                method: 'POST',
                success: alert("Successfully entered button EXIT")
            });

        });
    </script>

    <div class="wrapper">
        <div class="shell">
            <div class="main">
                <img class="profile-pic" src="./images/male.svg" width="30%" height="355">

                <div class="profile-pic-text">
                    <h2>Профилна информация</h2>

                    <p>Име: <%
                        assert userByID != null;
                        if(userByID.getFirstName() != null && userByID.getLastName() != null) {
                            out.print(userByID.getFirstName() + " " + userByID.getLastName());
                        }else {
                            userByID.setFirstName("Не съществува име за потребителя");
                        }
                     %> <br><br>
                        Работа: <% if(userByID.getWork() != null) {
                            out.print(userByID.getWork());
                        }else userByID.setWork("Не съществува работа за този потребител"); %> <br><br>

                        Описание: <% if(userByID.getDescribe() != null) {
                                StringBuffer str = new StringBuffer(userByID.getDescribe());
                                final int indexOfCut = 50;

                                if(userByID.getDescribe().length() > indexOfCut)
                                str.insert(indexOfCut, "<br>"); // insert at the n position new line

                                if(userByID.getDescribe().length() > indexOfCut*2+20)
                                str.insert(indexOfCut*2+20, "<br>");

                                out.print(str);
                        }else {
                            userByID.setDescribe("Няма описание за потребителя все още");
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
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getJava()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>HTML</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getHtml()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>CSS</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getCss()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>JavaScript</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getJavascript()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>

                    <div class="right-body">
                        <h3>Личностни</h3>

                        <div class="skill">
                            <p>Комуникативност</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getCommunicative()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>Екипна работа</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getTeamwork()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <div class="skill">
                            <p>Креативност</p>

                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width:<%= userByID.getTeamwork()*10 %>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
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

                        <p><a href="#"><% if(userByID.getEmail() != null) out.print(userByID.getEmail()); %></a></p>

                        <p>Телефон</p>

                        <p><a href="#"><% if(userByID.getPhoneNumber() != null) out.print(userByID.getPhoneNumber()); %></a></p>
                    </div>

                    <div class="right-down-bar">
                        <p>Град</p>

                        <p><% if(userByID.getTown() != null) out.print(userByID.getTown()); %></p>

                        <p>Улица</p>

                        <p><% if(userByID.getStreet() != null) out.print(userByID.getStreet()); %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer></footer>

</body>
</html>