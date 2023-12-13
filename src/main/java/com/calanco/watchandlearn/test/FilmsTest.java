package com.calanco.watchandlearn.test;

import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.adapters.DatabaseConnector;
import com.calanco.watchandlearn.adapters.FilmAdapter;
import java.sql.*;
import java.util.ArrayList;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class FilmsTest {
    private Film testFilm;
    private FilmAdapter testFilmAdapter;
    Connection connection;

    FilmsTest(){
        testFilm = new Film(0, "test", "https://ae04.alicdn.com/kf/A01a62fb3117944e39ae9f5ce4b50c130D.png", "coursach", 0, 0,
                "tests", 0, "example.com");
        testFilmAdapter = new FilmAdapter();
        try {
            connection = DatabaseConnector.connect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        try {
            String command = "DELETE FROM films;";
            PreparedStatement stmt = connection.prepareStatement(command);
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Test
    @DisplayName("Add Film")
    void createFilm() {
        Assertions.assertEquals(1, testFilmAdapter.addFilm(testFilm));

        boolean check = false;
        ArrayList<Film> films = testFilmAdapter.getFilms();
        for (Film film: films){
            if (film.getTitle().equals(testFilm.getTitle()) && film.getEpisode() == testFilm.getEpisode() && film.getSeason() == testFilm.getSeason()){
                check = true;
                break;
            }
        }

        Assertions.assertTrue(check);
    }

    @Test
    @DisplayName("Find incorrect Film")
    void findIncorrectFilm() {
        Film incorrectFilm = new Film(0, "incorrect", "incorrect", "incorrect", 0, 0,
                "incorrect", 0, "incorrect");

        boolean check = false;
        ArrayList<Film> films = testFilmAdapter.getFilms();
        for (Film film: films){
            if (incorrectFilm.getTitle().equals(testFilm.getTitle()) && incorrectFilm.getEpisode() == testFilm.getEpisode()
                    && incorrectFilm.getSeason() == testFilm.getSeason()){
                check = true;
                break;
            }
        }

        Assertions.assertFalse(check);
    }
}
