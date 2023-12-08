package com.calanco.watchandlearn;

import com.calanco.watchandlearn.adapters.FileAdapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "homeServlet", value = "/main")
public class HomeServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");
        HttpSession session = req.getSession();
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    public void destroy() {
    }
}