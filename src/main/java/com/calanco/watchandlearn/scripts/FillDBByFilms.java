package com.calanco.watchandlearn.scripts;

import com.calanco.watchandlearn.Models.AnswerOpinion;
import com.calanco.watchandlearn.Models.Film;
import com.calanco.watchandlearn.Models.Task;
import com.calanco.watchandlearn.adapters.FileAdapter;
import com.calanco.watchandlearn.adapters.FilmAdapter;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

public class FillDBByFilms {
    public static void main(String[] args) throws IOException {
        String film;
        String task;
        File folder = new File("src/main/webapp/videos");
        System.out.println(System.getProperty("user.dir"));
        File[] listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        FilmAdapter adapter = new FilmAdapter();
        adapter.delAllFilms();
        for (File listOfFile : listOfFiles) {
            if (listOfFile.isFile() && !listOfFile.getName().split("\\.")[1].equals("txt")) {
             //   System.out.println("File " + listOfFile.getName());
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

        folder = new File("src/main/webapp/tasks");
        listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        adapter.delAllTasks();
        for (File listOfFile : listOfFiles) {
            reader = new BufferedReader(new FileReader(listOfFile));
            while ((task = reader.readLine()) != null) {
                String[] ans = task.split("_")[2].split(",");
                String[] cor = task.split("_")[3].split(",");
                ArrayList<AnswerOpinion> ap = new ArrayList<>();
                for (int i = 0; i < ans.length; i++) {
                    ap.add(new AnswerOpinion(ans[i], Integer.parseInt(cor[i])));
                }
                adapter.addTask(new Task(
                        task.split("_")[3].split(",").length == 1 ? 0 : 1,
                        task.split("_")[1],
                        ap,
                        adapter.getFilmId(new Film(
                                listOfFile.getName().split("_")[0],
                                Integer.parseInt(listOfFile.getName().split("_")[2]),
                                Integer.parseInt(listOfFile.getName().split("_")[3]),
                                listOfFile.getName().split("_")[4].split("\\.")[0])),
                        Integer.parseInt(task.split("_")[0])
                ));
            }
        }
    }
}
