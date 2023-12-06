package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.User;

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
}
