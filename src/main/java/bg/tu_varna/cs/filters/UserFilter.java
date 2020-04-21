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
 *
 */
@WebFilter("/index")
public class UserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession(false);
        User sessionUser = (session != null)
                ? (User)session.getAttribute("user")
                : null;

        if (sessionUser == null) {
            res.sendRedirect("index");
        }else {
            filterChain.doFilter(req,res);
        }
    }
}
