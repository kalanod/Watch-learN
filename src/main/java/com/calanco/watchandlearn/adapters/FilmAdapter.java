package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.Film;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Arrays;

public class FilmAdapter {


    public static ArrayList<Film> getFilms() {
        return new ArrayList<>(Arrays.asList(new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a")));
    }


    public ArrayList<Film> getFilmsByGenre() {
        return null;
    }


    public ArrayList<Film> getFilmsWatched() {
        return null;
    }


    public Film getFilmById(String id) {
        return null;
    }


    public Film getFilmByTitle(String id) {
        return null;
    }


    public int addFilm(Film film) {
        return 0;
    }


    public int UpdateFilm(Film oldFilm, Film newFilm) {
        return 0;
    }

}