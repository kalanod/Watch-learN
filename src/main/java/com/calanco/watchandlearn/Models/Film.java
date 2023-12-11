package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class Film implements Serializable {
    int id;
    String title;
    String icnSrc;
    String genre;
    int season;
    int episode;
    int episodeTitle;

    public Film(String title, String icnSrc) {
        this.title = title;
        this.icnSrc = icnSrc;
        id = 0;
    }

    public Object getTitle() {
        return title;
    }

    public Object getId() {
        return id;
    }

    public String getIcnSrc() {
        return icnSrc;
    }

    public String getGenre() {
        return genre;
    }

    public int getSeason() {
        return season;
    }

    public int getEpisode() {
        return episode;
    }

    public int getEpisodeTitle() {
        return episodeTitle;
    }
}
