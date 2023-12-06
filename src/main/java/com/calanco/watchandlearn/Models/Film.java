package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class Film implements Serializable {
    String id;
    String title;
    String icnSrc;
    int genre;
    boolean isWatched;
    int season;
    int episod;

    public Film(String title) {
        this.title = title;
        icnSrc = "https://web-zoopark.ru/wp-content/uploads/2018/07/1-228.jpg";
        id = "0";
    }

    public Object getTitle() {
        return title;
    }
    public Object icnSrc() {
        return icnSrc;
    }

    public Object getId() {
        return id;
    }
}
