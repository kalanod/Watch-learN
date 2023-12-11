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
    boolean isWatched;

    public Film(String title) {
        this.title = title;
        icnSrc = "https://web-zoopark.ru/wp-content/uploads/2018/07/1-228.jpg";
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

    public String getIcnSrc() {
        return icnSrc;
    }

    public String getGenre() {
        return genre;
    }

    public boolean isWatched() {
        return isWatched;
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
