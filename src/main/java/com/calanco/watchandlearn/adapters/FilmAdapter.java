package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.Models.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

public class FilmAdapter {


    public static ArrayList<Film> getFilms() {
        return new ArrayList<>(Arrays.asList(new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"),
                new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"),
                new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a")));
    }


    public ArrayList<Film> getFilmsByGenre() {
        return null;
    }


    public ArrayList<Film> getFilmsWatched() {
        return null;
    }


    public Film getFilmById(String id) {
        return new Film("a");
    }
    public ArrayList<Film> getAllEpisodesById(String id) {
        return new ArrayList<>(Arrays.asList(new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"),
                new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"),
                new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a")));
    }

    public String getFilmUrlById(String id) {
        return "a.mp4";
    }
    public Film getFilmByTitle(String title) {
        return null;
    }


    public int addFilm(Film film) {
        return 0;
    }


    public int UpdateFilm(Film oldFilm, Film newFilm) {
        return 0;
    }

    public ArrayList<Film> getFilms(String type, int fromElem, int countElems) {
        /**
         * types: [films, serials]
         */
        ArrayList<Film> list = new ArrayList<>();
        for (int i = fromElem; i < fromElem+countElems && i < FilmAdapter.getFilms().size(); i++) {
            list.add(FilmAdapter.getFilms().get(i));
            System.out.println(i);
        }
        return list;
    }
    public ArrayList<Film> getFilms(String type, int fromElem, int countElems, User user) {
        /**
         * types: [films, serials, watched, recomendation, inProcess] FOR user
         */
        ArrayList<Film> list = new ArrayList<>();
        for (int i = fromElem; i < fromElem+countElems && i < FilmAdapter.getFilms().size(); i++) {
            list.add(FilmAdapter.getFilms().get(i));
            System.out.println(i);
        }
        return list;
    }

    public int getFilmsCount() {
        return getFilms().size();
    }
}