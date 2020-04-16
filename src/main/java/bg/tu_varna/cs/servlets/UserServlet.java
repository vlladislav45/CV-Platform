package bg.tu_varna.cs.servlets;

import bg.tu_varna.cs.domain.entities.User;
import bg.tu_varna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/*
 *
 * @author Vladislav Enev
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        editProfileLoggedUser(req,resp);
    }

    private void editProfileLoggedUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletContext ctx = req.getServletContext();
        UserSource users = (UserSource) ctx.getAttribute("users");

        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");

        if(!req.getParameter("first_name").isEmpty())
        users.searchUser(u).setFirstName(req.getParameter("first_name"));
        if(!req.getParameter("last_name").isEmpty())
        users.searchUser(u).setLastName( req.getParameter("last_name"));
        if(!req.getParameter("describe").isEmpty())
        users.searchUser(u).setDescribe( req.getParameter("describe"));
        if(!req.getParameter("work").isEmpty())
        users.searchUser(u).setWork( req.getParameter("work"));

        if(!req.getParameter("communicative").isEmpty())
        users.searchUser(u).setCommunicative(Integer.parseInt(req.getParameter("communicative")));
        if(!req.getParameter("creativity").isEmpty())
        users.searchUser(u).setCreativity(Integer.parseInt(req.getParameter("creativity")));
        if(!req.getParameter("teamwork").isEmpty())
        users.searchUser(u).setTeamwork(Integer.parseInt(req.getParameter("teamwork")));

        if(!req.getParameter("css").isEmpty())
        users.searchUser(u).setCss(Integer.parseInt(req.getParameter("css")));
        if(!req.getParameter("html").isEmpty())
        users.searchUser(u).setHtml(Integer.parseInt(req.getParameter("html")));
        if(!req.getParameter("java").isEmpty())
        users.searchUser(u).setJava(Integer.parseInt(req.getParameter("java")));
        if(!req.getParameter("javascript").isEmpty())
        users.searchUser(u).setJavascript(Integer.parseInt(req.getParameter("javascript")));

        users.searchUser(u).setPhoneNumber( req.getParameter("phone"));
        users.searchUser(u).setTown( req.getParameter("town"));
        users.searchUser(u).setStreet( req.getParameter("street"));

        //Do new session
        HttpSession newSession = req.getSession();
        newSession.removeAttribute("user");
        //We update old session because the user want to change his profile...
        newSession.setAttribute("user", u);

        resp.sendRedirect("index?user=" + u.getId()); // Send Redirect to User Servlet
    }
}
