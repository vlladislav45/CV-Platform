package bg.tuvarna.cs;

import bg.tuvarna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * @author Vladislav Enev
 */
@WebListener
public class Application implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        UserSource userSource = UserSource.getInstance();

        ServletContext ctx = sce.getServletContext();
        ctx.setAttribute("users", userSource);
    }

}