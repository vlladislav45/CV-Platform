package bg.tu_varna.cs.domain.entities;

import java.io.Serializable;
import java.util.Objects;

/*
 * Entity
 * JavaBean
 * @author Vladislav Enev
 */
public class User implements Serializable {
    private int id;
    private static int idCounter = 0;
    private String login;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String describe;
    private String work;
    //Profesional skills
    private int java;
    private int html;
    private int css;
    private int javascript;
    //Personal skills
    private int communicative;
    private int teamwork;
    private int creativity;
    //Contact
    private String phoneNumber;
    private String town;
    private String street;

    public User() {}

    public User(String login, String email, String password) {
        this.id = idCounter++;
        this.login = login;
        this.email = email;
        this.password = password;
    }

    public int getId() { return id; }

    public void setId(int m_id) { id = m_id; }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public int getJava() {
        return java;
    }

    public void setJava(int java) {
        this.java = java;
    }

    public int getHtml() {
        return html;
    }

    public void setHtml(int html) {
        this.html = html;
    }

    public int getCss() {
        return css;
    }

    public void setCss(int css) {
        this.css = css;
    }

    public int getJavascript() {
        return javascript;
    }

    public void setJavascript(int javascript) {
        this.javascript = javascript;
    }

    public int getCommunicative() {
        return communicative;
    }

    public void setCommunicative(int communicative) {
        this.communicative = communicative;
    }

    public int getTeamwork() {
        return teamwork;
    }

    public void setTeamwork(int teamwork) {
        this.teamwork = teamwork;
    }

    public int getCreativity() {
        return creativity;
    }

    public void setCreativity(int creativity) {
        this.creativity = creativity;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return  login.equals(user.login) ||
                Objects.equals(email, user.email);
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(login, email);
    }

    @Override
    public String toString() {
        return "Username: " + login + " email: " + email;
    }
}
