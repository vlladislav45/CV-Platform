package bg.tu_varna.cs.servlets;

import bg.tu_varna.cs.domain.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Vladislav Enev
 */
@WebServlet("/index")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session = req.getSession();
       User u = (User) session.getAttribute("user");
       if(session.getAttribute("user") != null)
       req.getRequestDispatcher("index.jsp?user=" + u.getId()).forward(req,resp);
       else req.getRequestDispatcher("index.jsp").include(req,resp);
    }
}
