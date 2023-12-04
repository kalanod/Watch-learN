package com.example.watchandlearn;

import jakarta.ws.rs.*;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.CharBuffer;

@Path("/")
public class MainResource {
    @GET
    @Produces("text/HTML")
    public String hello() {
        String a = "";
        a = getMainPage();
        System.out.println(a);
        return a;
    }

    public String getMainPage() {
        String a = "";
        try {
            a = FileUtils.readFileToString((new File("../webapps/Gradle___com_example___WatchAndLearn_1_0_SNAPSHOT_war/WEB-INF/classes/templates/index.html")));
        } catch (IOException ioException) {
            a = "server error? cant open index.html, ok??";
        }
        return a;
    }
}