package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.Film;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Arrays;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class FilmAdapter {


    public static ArrayList<Film> getFilms() {
        try (Connection connection = DatabaseConnector.connect()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films");
            ArrayList<Film> arrFilms = new ArrayList<>();
            while(rs.next()){
                Film film = new Film(rs.getString("title"), rs.getString("icnSrc"));
                arrFilms.add(film);
            }
            return arrFilms;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public static ArrayList<Film> getFilmsByGenre(String genre) {
        try (Connection connection = DatabaseConnector.connect()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films" +
                    "WHERE genre = " + genre + ";");
            ArrayList<Film> arrFilms = new ArrayList<>();
            while(rs.next()){
                Film film = new Film(rs.getString("title"), rs.getString("icnSrc"));
                arrFilms.add(film);
            }
            return arrFilms;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public static ArrayList<Film> getFilmsWatched() {
        return null;
    }


    public static Film getFilmById(int id) {
        try (Connection connection = DatabaseConnector.connect()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films" +
                    "WHERE id = " + id + ";");
            while(rs.next()){
                Film film = new Film(rs.getString("title"), rs.getString("icnSrc"));
                return film;
            }
            return null;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public static Film getFilmByTitle(String title) {
        try (Connection connection = DatabaseConnector.connect()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films" +
                    "WHERE title = " + title + ";");
            while(rs.next()){
                Film film = new Film(rs.getString("title"), rs.getString("icnSrc"));
                return film;
            }
            return null;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public static int addFilm(Film film) {
        return 0;
    }


    public static int UpdateFilm(Film oldFilm, Film newFilm) {
        return 0;
    }

}