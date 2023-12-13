package com.calanco.watchandlearn.scripts;

import com.calanco.watchandlearn.adapters.FilmAdapter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Scanner;

public class MakeTask {
    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
        String film;
        File folder = new File("src/main/webapp/videos");
        File[] listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        FilmAdapter adapter = new FilmAdapter();
        adapter.delAllFilms();
        ArrayList<String> films = new ArrayList<>();
        for (File listOfFile : listOfFiles) {
            if (listOfFile.isFile() && !listOfFile.getName().split("\\.")[1].equals("txt")) {
                films.add(listOfFile.getName().split("\\.")[0]);
            }
        }
        folder = new File("src/main/webapp/tasks");
        listOfFiles = folder.listFiles();
        assert listOfFiles != null;
        for (File listOfFile : listOfFiles) {
            films.remove(listOfFile.getName().split("\\.")[0]);
        }
        System.out.println("Films without tasks: " + films.size());
        Scanner scanner = new Scanner(System.in);
        String line;
        for (int i = 0; i < films.size(); i++) {
            System.out.println("film " + i + " :" + films.get(i));
            System.out.println("time_pos task_title [answer1,answer2,...] correct");
            PrintWriter writer = new PrintWriter("src/main/webapp/tasks/" + films.get(i)+".txt", "UTF-8");
            writer.flush();
            writer.close();
        }
    }
}
