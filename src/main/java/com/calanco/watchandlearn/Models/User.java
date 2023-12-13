package com.calanco.watchandlearn.Models;

import java.io.Serializable;
import java.util.ArrayList;

public class User implements Serializable {
    int id;
    String name;
    String email;
    String password;
    String color;
    String imgSrc;
    ArrayList<Integer> tasksCompleted;
    int tasksOnWay;
    public User() {
    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }
    public User(Integer id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getId() {
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
    public String getPassword() {
        return password;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public ArrayList<Integer> getTasksCompleted() {
        return tasksCompleted;
    }

    public int getTasksOnWay() {
        return tasksOnWay;
    }
}
