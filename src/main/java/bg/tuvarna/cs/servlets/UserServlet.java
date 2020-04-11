package bg.tuvarna.cs.servlets;

import bg.tuvarna.cs.domain.entities.User;
import bg.tuvarna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");

        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        ServletContext ctx = req.getServletContext();
        UserSource users = (UserSource) ctx.getAttribute("users");

        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("user");

        users.searchUser(u).setFirstName(req.getParameter("first_name"));
        users.searchUser(u).setLastName( req.getParameter("last_name"));
        users.searchUser(u).setDescribe( req.getParameter("describe"));
        users.searchUser(u).setWork( req.getParameter("work"));

        users.searchUser(u).setCommunicative(Integer.parseInt(req.getParameter("communicative")));
        users.searchUser(u).setCreativity(Integer.parseInt(req.getParameter("creativity")));
        users.searchUser(u).setTeamwork(Integer.parseInt(req.getParameter("teamwork")));

        users.searchUser(u).setCss(Integer.parseInt(req.getParameter("css")));
        users.searchUser(u).setHtml(Integer.parseInt(req.getParameter("html")));
        users.searchUser(u).setJava(Integer.parseInt(req.getParameter("java")));
        users.searchUser(u).setJavascript(Integer.parseInt(req.getParameter("javascript")));

        users.searchUser(u).setPhoneNumber( req.getParameter("phone"));
        users.searchUser(u).setTown( req.getParameter("town"));
        users.searchUser(u).setStreet( req.getParameter("street"));

        //Do new session
        HttpSession newSession = req.getSession();
        newSession.removeAttribute("user");
        //We update old session because the user want to change his profile...
        newSession.setAttribute("user", u);

        req.setCharacterEncoding("UTF-8");
        resp.sendRedirect("index.jsp");
    }
}
