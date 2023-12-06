package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.Models.User;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Collection;

public class UserAdapter implements UserInterface {
    @Override
    public User getUserById(String id) {
        return null;
    }

    @Override
    public int addNewUser(User user) {
        return 0;
    }

    @Override
    public int updateUser(User oldUser, User newUser) {
        return 0;
    }

    /**
     * Проверка на правильность пароля и логина, есть ли данны в БД
     **/
    @Override
    public boolean isCorrectData(User user) {
        return false;
    }

    public boolean isAuthorized(HttpSession session) {
        return false;
    }

    public ArrayList<Film> getRecomendatedFilms(HttpSession session) {
        return FilmAdapter.getFilms();
    }

    public ArrayList<Film> getLastWatchedFilms(HttpSession session) {
        return FilmAdapter.getFilms();
    }
}
