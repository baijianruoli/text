package liqiqi.text;

import org.springframework.stereotype.Component;


public class user {
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }



    @Override
    public String toString() {
        return "user{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    private String username;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String password;
    public user(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public user()
    {

    }
}
