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


    public static ArrayList<Film> getFilms() {
        try (Connection connection = DatabaseConnector.connect()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM films");
            ArrayList<Film> arrFilms = new ArrayList<>();
            while(rs.next()){
                Film film = new Film(rs.getString("title"));
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
                Film film = new Film(rs.getString("title"));
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
                Film film = new Film(rs.getString("title"));
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
                Film film = new Film(rs.getString("title"));
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

    public ArrayList<Task> getTasksById(String id) {
        return new ArrayList<>(Arrays.asList(
                new Task(1, "task1",new ArrayList<>(Arrays.asList(
                        new AnswerOpinion("ans1", 1),
                        new AnswerOpinion("ans2", 0))), "1", 2),
                new Task(1, "task2",new ArrayList<>(Arrays.asList(
                        new AnswerOpinion("ans1", 1),
                        new AnswerOpinion("ans2", 0))), "1", 4)));
    }
}