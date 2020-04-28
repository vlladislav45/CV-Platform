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
import javax.xml.bind.JAXBException;
import java.io.IOException;

/**
 *
 * @author Vladislav Enev
 */
@WebServlet("/profile_info")
public class ProfileInfoServlet extends HttpServlet {

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

        //Do new session
        HttpSession newSession = req.getSession();
        newSession.removeAttribute("user");
        //We update old session because the user want to change his profile...
        newSession.setAttribute("user", u);
        try {
            users.marshal(users);
        } catch (JAXBException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("editprofile");
    }
}
