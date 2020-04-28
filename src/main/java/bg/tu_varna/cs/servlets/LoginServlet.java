package bg.tu_varna.cs.servlets;

import bg.tu_varna.cs.domain.entities.User;
import bg.tu_varna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author Vladislav Enev
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static int id = 1;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("static/login.html").include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        ServletContext ctx = req.getServletContext();
        UserSource users = (UserSource) ctx.getAttribute("users");

        User u = new User();
        //u.setId(++id);
        u.setLogin(req.getParameter("login"));
        u.setPassword(req.getParameter("pwd"));

        //Only for TESTS
        //users.addUser(u);

        if(users.searchUser(u) != null) {
            User loggedUser = users.searchUser(u);

            HttpSession session = req.getSession();
            session.setAttribute("user", loggedUser);

            resp.sendRedirect("editprofile");
        }else {
            out.print("<font color=red>Incorrect username/email or password</font>");
            req.getRequestDispatcher("static/login.html").include(req,resp);
        }
    }

}
