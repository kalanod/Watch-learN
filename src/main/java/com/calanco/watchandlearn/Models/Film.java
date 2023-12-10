package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class Film implements Serializable {
    String id;
    String title;
    String icnSrc;
    int genre;
    boolean isWatched;
    int season;
    int episode;
    int episodeTitle;

    public Film(String title) {
        this.title = title;
        icnSrc = "https://web-zoopark.ru/wp-content/uploads/2018/07/1-228.jpg";
        id = "0";
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

    public int getGenre() {
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
