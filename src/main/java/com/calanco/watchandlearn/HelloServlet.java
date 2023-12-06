package com.calanco.watchandlearn;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        String a = "";
        try {
            a = FileUtils.readFileToString((new File("../webapps/Gradle___com_example___WatchAndLearn_1_0_SNAPSHOT_war/WEB-INF/classes/templates/index.html")));
        } catch (IOException ioException) {
            a = "server error? cant open index.html, ok??";
        }
        out.println(a);
    }

    public void destroy() {
    }
}