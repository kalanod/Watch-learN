package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.Models.User;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;


public class UserAdapter implements UserInterface {
    Connection connection;

    public UserAdapter() {
        try {
            connection = DatabaseConnector.connect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public User getUserById(String id) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE id = " + id + ";");
            while (rs.next()) {
                User user = new User(
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int addNewUser(User user) {
        try {
            if (isEmailRegistred(user)) return 0;
            String command = " INSERT INTO users (name, email, password)"
                    + " VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(command);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            System.out.println(stmt);
            stmt.execute();
            System.out.println(0);
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private boolean isEmailRegistred(User u) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + u.getEmail() + "';");
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public synchronized void addCompleted(User u, String i) {
        System.out.println(u.getId());
        System.out.println(i);
        System.out.println("pop");
        try {
            String st = String.join(",", getWatched(u)) + "," + i;
            String command = " UPDATE users SET completed = '"+st+"' WHERE id = " + u.getId()+";";
            PreparedStatement stmt = connection.prepareStatement(command);
            System.out.println(stmt);
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public synchronized ArrayList<String> getWatched(User u) {
        try {
            Statement stmt = connection.createStatement();
            String st;
            ResultSet rs = stmt.executeQuery(
                    "SELECT completed FROM users WHERE id = "+ u.getId()+";");
            if (rs.next() && !(rs.getString("completed") == null)){
                return new ArrayList<>(Arrays.asList(rs.getString("completed").split(",")));
            };
            return new ArrayList<>();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public int updateUser(User oldUser, User newUser) {
        return 0;
    }

    /**
     * Проверка на правильность пароля и логина, есть ли данны в БД
     */
    @Override
    public int isCorrectData(User user) {
        try (Connection connection = DatabaseConnector.connect()) {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            ArrayList<Film> arrFilms = new ArrayList<>();
            while (rs.next()) {
                if (user.getEmail().equals(rs.getString("email")) &&
                        user.getPassword().equals(rs.getString("password"))){
                    return 1;
                }
            }
            return 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public boolean isAuthorized(User user) {
        if (user == null) {
            System.out.println("null");
            return false;
        }
        System.out.println(user.getName());
        return true;
    }

    public ArrayList<Film> getRecomendatedFilms(User user) {
        return FilmAdapter.getFilms();
    }

    public ArrayList<Film> getLastWatchedFilms(User user) {
        return FilmAdapter.getFilms();
    }


    public User fillUser(User u) {
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + u.getEmail()+ "'" +
                    "and password = '"+u.getPassword()+"';");
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
