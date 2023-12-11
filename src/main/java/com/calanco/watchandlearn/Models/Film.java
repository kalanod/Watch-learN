package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class Film implements Serializable {
    int id;
    String title;
    String icnSrc;
    String genre;
    int season;
    int episode;

    public Film(String title, String icnSrc) {
        this.title = title;
        this.icnSrc = icnSrc;
        id = 0;
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
