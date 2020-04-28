package bg.tu_varna.cs;

import bg.tu_varna.cs.domain.entities.User;
import bg.tu_varna.cs.domain.entities.UserSource;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.xml.bind.JAXBException;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Vladislav Enev
 */
@WebListener
public class Context implements ServletContextListener {
      @Override
    public void contextInitialized(ServletContextEvent sce) {
          UserSource userSource = null;
          try {
              userSource = UserSource.getInstance();
          } catch (JAXBException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }

          ServletContext ctx = sce.getServletContext();
        ctx.setAttribute("users", userSource);
    }

}