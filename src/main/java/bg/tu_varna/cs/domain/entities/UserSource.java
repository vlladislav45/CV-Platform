package bg.tu_varna.cs.domain.entities;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/*
 *
 * @author Vladislav Enev
 */
@XmlRootElement(name = "users")
@XmlAccessorType(XmlAccessType.FIELD)
public class UserSource {
    private static UserSource instance = null;
    @XmlElement(name = "user")
    private Set<User> users = new HashSet<>();

    private UserSource () { }

    static public UserSource getInstance() throws JAXBException, IOException {
        if (instance == null) {
            instance = new UserSource();

            instance.setUsers(unmarshall());
        }
        return instance;
    }

    public void addUser(User user) {
        users.add(user);
    }

    public User searchUser(User user) {
        for(User u : users) {
            if(u.equals(user) && u.getPassword().equals(user.getPassword())) {
                return u;
            }
        }
        return null;
    }

    public User getById(int id) {
        for(User u : users) {
            if(u.getId() == id) {
                return u;
            }
        }
        return null;
    }

    public Set<User> getUsers() {
        return this.users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public static Set<User> unmarshall() throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(UserSource.class);
         UserSource userSource = (UserSource) context.createUnmarshaller()
                .unmarshal(new FileReader("D:/Vladislav/Java_projects/pti/src/main/webapp/data/users.xml"));

         if(userSource != null) {
             return userSource.getUsers();
         }else {
             return null;
         }
    }

    public void marshal(UserSource users) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(UserSource.class);
        Marshaller mar = context.createMarshaller();
        mar.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
        mar.marshal(users, new File("D:/Vladislav/Java_projects/pti/src/main/webapp/data/users.xml"));
    }
}
