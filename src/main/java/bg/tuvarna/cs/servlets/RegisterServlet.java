package bg.tuvarna.cs.servlets;

import bg.tuvarna.cs.domain.entities.User;
import bg.tuvarna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/*
 *
 * @author Vladislav Enev
*/
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {

            request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            ServletContext ctx = request.getServletContext();
            UserSource users = (UserSource) ctx.getAttribute("users");
            if(users == null) {
                //TODO: logger
                out.println("User Source is not initialized");
            }else {
                User u = new User();
                u.setLogin(request.getParameter("username"));
                u.setEmail(request.getParameter("email"));
                u.setPassword(request.getParameter("pwd"));

                //if it is first user and tries to register, do not make statement
                if(users.getUsers() != null) {
                    if(users.searchUser(u) != null) {
                        //if the user already exist in our system base
                        out.println("User already exist with this name or email address, try again.");
                        return;
                    }
                }
                users.addUser(u);

                response.sendRedirect("login");
            }
    }

}
