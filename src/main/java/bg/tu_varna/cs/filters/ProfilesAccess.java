package bg.tu_varna.cs.filters;

import bg.tu_varna.cs.domain.entities.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Vladislav Enev
 */
@WebFilter("/profiles")
public class ProfilesAccess implements Filter{

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        User sessionUser = (session != null)
                ? (User)session.getAttribute("user")
                : null;
        if (sessionUser == null) {
            res.sendRedirect("login");
        } else {
            chain.doFilter(request, response);
        }
    }

}



