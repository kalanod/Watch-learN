package com.calanco.watchandlearn.Models;

public class AnswerOpinion {
    String title;
    int isCorrect;

    public AnswerOpinion(String title, int isCorrect) {
        this.title = title;
        this.isCorrect = isCorrect;
    }

    public String getTitle() {
        return title;
    }

    public int isCorrect() {
        return isCorrect;
    }

    @Override
    public String toString() {
        return "{" +
                "title:'" + title + '\'' +
                ",isCorrect:" + isCorrect +
                '}';
    }
}
