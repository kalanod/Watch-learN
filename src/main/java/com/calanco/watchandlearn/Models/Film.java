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
    }
}
