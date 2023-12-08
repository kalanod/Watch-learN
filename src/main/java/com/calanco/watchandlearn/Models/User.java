package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class User implements Serializable {
    String id;
    String name;
    String email;
    String password;
    String color;
    String imgSrc;
    int tasksCompleted;
    int tasksOnWay;
    public User() {
    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
        id = "0";
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getColor() {
        return color;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public int getTasksCompleted() {
        return tasksCompleted;
    }

    public int getTasksOnWay() {
        return tasksOnWay;
    }
}
