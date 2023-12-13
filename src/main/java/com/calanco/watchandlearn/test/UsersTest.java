package com.calanco.watchandlearn.test;

import com.calanco.watchandlearn.Models.User;
import com.calanco.watchandlearn.adapters.DatabaseConnector;
import com.calanco.watchandlearn.adapters.UserAdapter;
import java.sql.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class UsersTest {
    private User testUser;
    private UserAdapter testUserAdapter;
    Connection connection;

    UsersTest(){
        testUser = new User("test", "test@email.net", "1234");
        testUserAdapter = new UserAdapter();
        try {
            connection = DatabaseConnector.connect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        try {
            String command = "DELETE FROM users;";
            PreparedStatement stmt = connection.prepareStatement(command);
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Test
    @DisplayName("Add User")
    public void createUser() {
        Assertions.assertEquals(1, testUserAdapter.addNewUser(testUser));
        Assertions.assertEquals(1, testUserAdapter.isCorrectData(testUser));
    }

    @Test
    @DisplayName("Find incorrect User")
    public void findIncorrectUser() {
        User incorrectUser = new User("incorrect", "incorrect", "incorrect");
        Assertions.assertEquals(0, testUserAdapter.isCorrectData(incorrectUser));
    }
}
