package bg.tu_varna.cs.servlets;

import bg.tu_varna.cs.domain.entities.User;
import bg.tu_varna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

/**
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
                out.println("User Source is not initialized");
            }else {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("pwd");
                int id = (users.getUsers().size() - 1) + 1;
                User u = new User(id,username, email, password);

                //if it is first user and tries to register, do not make statement
                if(users.getUsers() != null) {
                    if(users.searchUser(u) != null) {
                        //if the user already exist in our system base
                        out.println("User already exist with this name or email address, try again.");
                        return;
                    }
                }
                users.addUser(u);
                try {
                    users.marshal(users);
                } catch (JAXBException e) {
                    e.printStackTrace();
                }

                response.sendRedirect("login");
            }
    }

}
