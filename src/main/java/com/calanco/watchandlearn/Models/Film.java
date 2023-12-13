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
    String filmUrl;
    String type;

    @Deprecated
    public Film(String title, String icnSrc) {
        this.title = title;
        this.icnSrc = icnSrc;
        id = 0;
    }
    public Film(String title, int season, int episode, String epTitle) {
        this.title = title;
        this.season = season;
        this.episode = episode;
        this.episodeTitle = epTitle;
    }

    public Film(int id, String title, String icnSrc, String genre, int season, int episode, String episodeTitle, int isWatched, String filmUrl) {
        this.id = id;
        this.title = title;
        this.icnSrc = icnSrc;
        this.genre = genre;
        this.season = season;
        this.episode = episode;
        this.episodeTitle = episodeTitle;
        this.isWatched = isWatched == 1;
        this.filmUrl = filmUrl;
    }


    public Film(String title, String genre, int season, int episode, String episodeTitle, String type) {
        this.title = title;
        this.icnSrc = "preview/" + title + ".jpg";
        this.genre = genre;
        this.season = season;
        this.episode = episode;
        this.episodeTitle = episodeTitle;
        this.filmUrl = "videos/" + title + "_" + genre +
        "_" + season + "_" + episode + "_" + episodeTitle + "." + type;
    }
    public Film(String title, String genre, int season, int episode, String episodeTitle, String type, String url) {
        this.title = title;
        this.icnSrc = "preview/" + title + ".jpg";
        this.genre = genre;
        this.season = season;
        this.episode = episode;
        this.episodeTitle = episodeTitle;
        this.filmUrl = url;
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

    public String getFilmUrl() {
        return filmUrl;
    }
}
