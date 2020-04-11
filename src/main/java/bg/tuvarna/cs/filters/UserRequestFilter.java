package bg.tuvarna.cs.filters;

import bg.tuvarna.cs.domain.entities.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*
 *
 * @author Vladislav Enev
 */
@WebFilter("/register")
public class UserRequestFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        List<String> errs = new ArrayList<>();
        User u = new User();

        if("POST".equals(request.getMethod())) {
            u.setLogin(request.getParameter("username"));
            if (u.getLogin() == null || u.getLogin().isEmpty()) {
                String usernameErr = "* Username cannot be empty";
                errs.add(usernameErr);
            }
            u.setEmail(request.getParameter("email"));
            if (u.getEmail() == null || u.getEmail().isEmpty()) {
                String emailErr = "* Email cannot be empty";
                errs.add(emailErr);
            }
            String pass = request.getParameter("pwd");
            String confirmPass = request.getParameter("confirm-pwd");
            if(pass.isEmpty() || confirmPass.isEmpty() || pass.length() < 8 || confirmPass.length() < 8) {
                String passErr = "* Password is required";
                errs.add(passErr);
            }else {
                if(!pass.equals(confirmPass)) {
                    String confirmPassErr = "* Your passwords do not match";
                    errs.add(confirmPassErr);
                }
            }
        }

        if(errs.isEmpty()) {
            filterChain.doFilter(request, response);
        }else {
            request.setAttribute("list_errors", errs);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }

}
