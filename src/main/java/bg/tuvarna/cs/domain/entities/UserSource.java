package bg.tuvarna.cs.domain.entities;

import java.util.HashSet;
import java.util.Set;

/*
 *
 * @author Vladislav Enev
 */
public class UserSource {
    private static UserSource instance = null;
    private Set<User> users = new HashSet<>();

    private UserSource () { }

    static public UserSource getInstance()     {
        if (instance == null)
            instance = new UserSource ();
        return instance;
    }

    public void addUser(User user) {
        users.add(new User(user.getLogin(),user.getEmail(),user.getPassword()));
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
}
