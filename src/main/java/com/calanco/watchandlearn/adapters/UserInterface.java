package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.User;

public interface UserInterface {
    User getUserById(String id);

    int addNewUser(User user);

    int updateUser(User oldUser, User newUser);

    boolean isCorrectData(User user);
}
