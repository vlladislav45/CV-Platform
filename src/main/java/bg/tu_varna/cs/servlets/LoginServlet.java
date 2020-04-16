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
    private User loggedUser;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("static/login.html").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        ServletContext ctx = req.getServletContext();
        UserSource users = (UserSource) ctx.getAttribute("users");

        //ONLY FOR TESTS
        users.addUser(testAddUser());

        User u = new User();
        u.setLogin(req.getParameter("login"));
        u.setPassword(req.getParameter("pwd"));

        //Only for TESTS
        //users.addUser(u);

        if(users.searchUser(u) != null) {
            this.loggedUser = users.searchUser(u);

            HttpSession session = req.getSession();
            session.setAttribute("user", loggedUser);

            resp.sendRedirect("index?user=" + loggedUser.getId());
        }else {
            out.print("<font color=red>Incorrect username/email or password</font>");
            req.getRequestDispatcher("static/login.html").include(req,resp);
        }
    }

    private static User testAddUser() {
        //Only for TESTS
        User u = new User("vladislavl3", "vladislavl3@abv.bg", "123456");
        u.setDescribe("Студент, който малко бачка по проектите си");
        u.setWork("Студент");
        u.setCommunicative(5);
        u.setCreativity(2);
        u.setCss(4);
        u.setFirstName("ivan");
        u.setJava(3);
        u.setJavascript(5);
        u.setLastName("Бонев");
        u.setHtml(6);
        u.setPhoneNumber("0893933345");
        u.setStreet("Бул 5 Юни");
        u.setTeamwork(10);
        u.setTown("София");

        return u;
    }

}
