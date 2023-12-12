package com.calanco.watchandlearn;

import com.calanco.watchandlearn.Models.User;
import com.calanco.watchandlearn.adapters.UserAdapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User(
                req.getParameter("email"),
                req.getParameter("password"));
        System.out.println(req.getParameter("email"));
        UserAdapter adapter = new UserAdapter();
        int res = adapter.isCorrectData(user);
        resp.getWriter().print(res);
        if (res == 1) req.getSession().setAttribute("User", adapter.fillUser(user));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
