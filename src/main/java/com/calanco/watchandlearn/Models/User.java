package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class User implements Serializable {
    String name;

    public User() {
    }

    String email;
    String password;

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
}
