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

@WebServlet("/profile_additional_info")
public class ProfileAdditionalInfoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext ctx = req.getServletContext();
        UserSource users = (UserSource) ctx.getAttribute("users");

        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");

        if(!req.getParameter("email").isEmpty())
            users.searchUser(u).setEmail(req.getParameter("email"));
        if(!req.getParameter("phone").isEmpty())
            users.searchUser(u).setPhoneNumber( req.getParameter("phone"));
        if(!req.getParameter("town").isEmpty())
            users.searchUser(u).setTown( req.getParameter("town"));
        if(!req.getParameter("street").isEmpty())
            users.searchUser(u).setStreet( req.getParameter("street"));

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
