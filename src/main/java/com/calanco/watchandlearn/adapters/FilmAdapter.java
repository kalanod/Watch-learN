package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.AnswerOpinion;
import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.Models.Task;
import com.calanco.watchandlearn.Models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;


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
        try (Connection connection = DatabaseConnector.connect()) {
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
                        rs.getInt("isWatched"),
                        rs.getString("filmUrl"));
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM films WHERE genre = " + genre + ";");
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
                        rs.getInt("isWatched"),
                        rs.getString("filmUrl"));
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
                        rs.getInt("isWatched"),
                        rs.getString("filmUrl"));
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM films WHERE title = '" + title + "';");
            while (rs.next()) {
                Film film = new Film(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("icnSrc"),
                        rs.getString("genre"),
                        rs.getInt("season"),
                        rs.getInt("episode"),
                        rs.getString("episodeTitle"),
                        rs.getInt("isWatched"),
                        rs.getString("filmUrl"));
                return film;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public ArrayList<Film> getAllEpisodesById(String id) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet title_res = stmt.executeQuery("SELECT * FROM films WHERE id = " + id + ";");
            String title = "";
            while (title_res.next()) {
                title = title_res.getString("title");
            }
            ResultSet rs = stmt.executeQuery("SELECT * FROM films WHERE title = '" + title + "';");
            ArrayList<Film> films = new ArrayList<>();
            while (rs.next()) {
                Film film = new Film(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("icnSrc"),
                        rs.getString("genre"),
                        rs.getInt("season"),
                        rs.getInt("episode"),
                        rs.getString("episodeTitle"),
                        rs.getInt("isWatched"),
                        rs.getString("filmUrl"));
                films.add(film);
            }
            return films;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public String getFilmUrlById(String id) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films WHERE id = " + id + ";");
            while (rs.next()) {
                return rs.getString("filmUrl");
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public int delAllFilms() {
        try {
            String command = "DELETE FROM films";
            PreparedStatement stmt = connection.prepareStatement(command);
            stmt.execute();
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public int addFilm(Film film) {
        //insert into films (title, icnSrc, genre, season, episode, episodeTitle, isWatched, filmUrl) values ('BokuNoPico', 'https://cdn.myanimelist.net/images/anime/12/39497.jpg', 'what', 1, 3, 'End of Evangelion', 0, 'penta.webm');
        try {
            String command = " INSERT INTO films (title, icnSrc, genre, season, episode, episodeTitle, filmUrl)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(command);
            stmt.setString(1, film.getTitle().toString());
            stmt.setString(2, film.getIcnSrc());
            stmt.setString(3, film.getGenre());
            stmt.setInt(4, film.getSeason());
            stmt.setInt(5, film.getEpisode());
            stmt.setString(6, film.getEpisodeTitle());
            stmt.setString(7, film.getFilmUrl());
            stmt.execute();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
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