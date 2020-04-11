<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register-Form</title>
    <link rel="stylesheet" href="styles/register.css">

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

    <h1>Създаване на профил</h1>

    <form action="register" method="POST">
        <label class="lab" for="username">Име:</label>
        <input id="username" name="username" type="text" placeholder="Въведете име за контакт"/>

        <label class="lab" for="email">Имейл адрес:</label>
        <input id="email" name="email" type="email" placeholder="Въведете имейл адрес"/>

        <label for="pwd">Парола:</label>
        <input id="pwd" name="pwd" type="password" placeholder="Въведете парола поне с 8 символа"/>

        <label for="confirm-pwd">Повторете паролата:</label>
        <input id="confirm-pwd" name="confirm-pwd" type="password" placeholder="Въведете парола поне с 8 символа"/>

        <input class="submit" name="submit" type="submit" value="Вход">

        <span id='message'></span>
        <div class="error"><%
            List<String> errors = (ArrayList<String>) request.getAttribute("list_errors");
            if(errors != null) {
                for(String err : errors) {
                    out.println(err);
                }
            }
        %></div>
        <div class='success'></div>
    </form>

    <footer></footer>

    <script>
        $(document).ready(function(){
            $('#pwd, #confirm-pwd').on('keyup', function () {
                if ($('#pwd').val() == $('#confirm-pwd').val()) {
                    $('#message').html('Matching').css('color', 'green');
                } else
                    $('#message').html('Not Matching').css('color', 'red');
            });
        });
    </script>

</body>
</html>