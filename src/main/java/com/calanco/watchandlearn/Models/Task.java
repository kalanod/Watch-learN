package com.calanco.watchandlearn.Models;

import java.util.ArrayList;

public class Task {
    String id;
    int isMultipleAnswers;
    String title;
    ArrayList<AnswerOpinion> answers;
    int forFilmId;
    int posStart;
    int isFinished;

    public int isFinished() {
        return isFinished;
    }

    public Task(int i) {
        posStart = i;
    }

    public Task(int isMultipleAnswers, String title, ArrayList<AnswerOpinion> answers, int forFilmId, int posStart) {
        this.isMultipleAnswers = isMultipleAnswers;
        this.title = title;
        this.answers = answers;
        this.forFilmId = forFilmId;
        this.posStart = posStart;
    }

    public String getId() {
        return id;
    }

    public int getIsMultipleAnswers() {
        return isMultipleAnswers;
    }

    public String getTitle() {
        return title;
    }

    public ArrayList<AnswerOpinion> getAnswers() {
        return answers;
    }

    public int getForFilmId() {
        return forFilmId;
    }

    public int getPosStart() {
        return posStart;
    }

    @Override
    public String toString() {
        return "{" +
                "id:'" + id +
                "',isMultipleAnswers:" + isMultipleAnswers +
                ",title:'" + title +
                "',answers:" + answers +
                ",forFilmId:" + forFilmId +
                ",posStart:" + posStart +
                ",isFinished:" + isFinished +
                '}';
    }

    public String[] getAnswersTitle() {
        return answers.stream().map(AnswerOpinion::getTitle).toArray(String[]::new);
    }

    public String[] getAnswersCorrects() {
        return answers.stream().map(x -> String.valueOf(x.getIsCorrect())).toArray(String[]::new);

    }
}
