package com.calanco.watchandlearn.Models;

import java.io.Serializable;

public class Film implements Serializable {
    int id;
    String title;
    String icnSrc;
    String genre;
    int season;
    int episode;
    String episodeTitle;
    boolean isWatched;

    public Film(String title, String icnSrc) {
        this.title = title;
        this.icnSrc = icnSrc;
        id = 0;
    }

    public Film(int id, String title, String icnSrc, String genre, int season, int episode, String episodeTitle, int isWatched) {
        this.id = id;
        this.title = title;
        this.icnSrc = icnSrc;
        this.genre = genre;
        this.season = season;
        this.episode = episode;
        this.episodeTitle = episodeTitle;
        this.isWatched = isWatched == 1;
    }

    public Film(String a) {
        title = a;
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

    public boolean isWatched() {
        return isWatched;
    }

    public int getSeason() {
        return season;
    }

    public int getEpisode() {
        return episode;
    }

    public String getEpisodeTitle() {
        return episodeTitle;
    }
}
