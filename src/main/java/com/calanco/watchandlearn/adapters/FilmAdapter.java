package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.AnswerOpinion;
import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.Models.Task;
import com.calanco.watchandlearn.Models.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class FilmAdapter {
    Connection connection;

    public FilmAdapter() {
        try {
            connection = DatabaseConnector.connect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Film> getFilms() {
        try (Connection connection = DatabaseConnector.connect()){
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films");
            ArrayList<Film> arrFilms = new ArrayList<>();
            while (rs.next()) {
                Film film = new Film(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("icnSrc"),
                        rs.getString("genre"),
                        rs.getInt("season"),
                        rs.getInt("episode"),
                        rs.getString("episodeTitle"),
                        rs.getInt("isWatched"));
                arrFilms.add(film);
            }
            return arrFilms;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public synchronized ArrayList<Film> getFilmsByGenre(String genre) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films" +
                    "WHERE genre = " + genre + ";");
            ArrayList<Film> arrFilms = new ArrayList<>();
            while (rs.next()) {
                Film film = new Film(rs.getString("title"), rs.getString("icnSrc"));
                arrFilms.add(film);
            }
            return arrFilms;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public ArrayList<Film> getFilmsWatched() {
        return null;
    }

    public synchronized Film getFilmById(String id) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films WHERE id = " + id + ";");
            while (rs.next()) {
                Film film = new Film(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("icnSrc"),
                        rs.getString("genre"),
                        rs.getInt("season"),
                        rs.getInt("episode"),
                        rs.getString("episodeTitle"),
                        rs.getInt("isWatched"));
                return film;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public synchronized Film getFilmByTitle(String title) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films" +
                    "WHERE title = " + title + ";");
            while (rs.next()) {
                Film film = new Film(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("icnSrc"),
                        rs.getString("genre"),
                        rs.getInt("season"),
                        rs.getInt("episode"),
                        rs.getString("episodeTitle"),
                        rs.getInt("isWatched"));
                return film;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public ArrayList<Film> getAllEpisodesById(String id) {
        return new ArrayList<>(Arrays.asList(new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"),
                new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"),
                new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a"), new Film("a")));
    }

    public String getFilmUrlById(String id) {
        return "a.mp4";
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
        for (int i = fromElem; i < fromElem + countElems && i < FilmAdapter.getFilms().size(); i++) {
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
        for (int i = fromElem; i < fromElem + countElems && i < FilmAdapter.getFilms().size(); i++) {
            list.add(FilmAdapter.getFilms().get(i));
            System.out.println(i);
        }
        return list;
    }

    public int getFilmsCount() {
        return getFilms().size();
    }

    public ArrayList<Task> getTasksById(String id) {
        return new ArrayList<>(Arrays.asList(
                new Task(1, "task1", new ArrayList<>(Arrays.asList(
                        new AnswerOpinion("ans1", 1),
                        new AnswerOpinion("ans2", 0))), "1", 2),
                new Task(1, "task2", new ArrayList<>(Arrays.asList(
                        new AnswerOpinion("ans1", 1),
                        new AnswerOpinion("ans2", 0))), "1", 4)));
    }

}