package com.calanco.watchandlearn.scripts;

import com.calanco.watchandlearn.adapters.FileAdapter;
import com.calanco.watchandlearn.adapters.FilmAdapter;

import java.io.File;

public class FillDBByFilms {
    public static void main(String[] args) {
        File folder = new File("src/main/webapp/videos");
        System.out.println(System.getProperty("user.dir"));
        File[] listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        FilmAdapter adapter = new FilmAdapter();
        adapter.delAllFilms();
        for (File listOfFile : listOfFiles) {
            if (listOfFile.isFile()) {
                System.out.println("File " + listOfFile.getName());
                adapter.addFilm(listOfFile.getName());
            }
        }
    }
}
