package com.calanco.watchandlearn.scripts;

import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.adapters.FileAdapter;
import com.calanco.watchandlearn.adapters.FilmAdapter;

import java.io.*;

public class FillDBByFilms {
    public static void main(String[] args) throws IOException {
        String film;
        File folder = new File("src/main/webapp/videos");
        System.out.println(System.getProperty("user.dir"));
        File[] listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        FilmAdapter adapter = new FilmAdapter();
        adapter.delAllFilms();
        for (File listOfFile : listOfFiles) {
            if (listOfFile.isFile() && !listOfFile.getName().split("\\.")[1].equals("txt")) {
                System.out.println("File " + listOfFile.getName());
                film = listOfFile.getName();
                adapter.addFilm(new Film(
                        film.split("_")[0],
                        film.split("_")[1],
                        Integer.parseInt(film.split("_")[2]),
                        Integer.parseInt(film.split("_")[3]),
                        film.split("_")[4].split("\\.")[0],
                        film.split("\\.")[1]));
            }
        }
        File file = new File("src/main/webapp/videos/externalVideos.txt");
        BufferedReader reader = new BufferedReader(new FileReader(file));
        while ((film = reader.readLine()) != null)
            adapter.addFilm(new Film(
                    film.split("_")[0],
                    film.split("_")[1],
                    Integer.parseInt(film.split("_")[2]),
                    Integer.parseInt(film.split("_")[3]),
                    film.split("_")[4],
                    film.split("_")[5]));
    }
}
