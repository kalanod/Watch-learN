package com.example.watchandlearn;

import jakarta.ws.rs.*;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.CharBuffer;

@Path("/hello")
public class NewResource {
    @GET
    @Produces("text/HTML")
    public String hello() {
        String a = "";
        try {
            a = FileUtils.readFileToString((new File("../webapps/Gradle___com_example___WatchAndLearn_1_0_SNAPSHOT_war/WEB-INF/classes/templates/Main.html")));
        } catch (IOException e) {
        }
        System.out.println(a);
        return a;
    }
}