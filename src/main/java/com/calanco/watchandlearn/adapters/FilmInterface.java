package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.Film;

import java.util.ArrayList;

public interface FilmInterface {
    ArrayList<Film> getFilms();

    ArrayList<Film> getFilmsByGenre();

    ArrayList<Film> getFilmsWatched();

    Film getFilmById(String id);

    Film getFilmByTitle(String id);

    int addFilm(Film film);

    int UpdateFilm(Film oldFilm, Film newFilm);

}
