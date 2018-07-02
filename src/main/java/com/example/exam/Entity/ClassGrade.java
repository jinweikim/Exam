package com.example.exam.Entity;

public class ClassGrade {

    private String class_name;
    private int maxGrade;
    private int minGrade;
    private int AverageGrade;

    public ClassGrade(String class_name, int maxGrade, int minGrade, int averageGrade) {
        this.class_name = class_name;
        this.maxGrade = maxGrade;
        this.minGrade = minGrade;
        AverageGrade = averageGrade;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getMaxGrade() {
        return maxGrade;
    }

    public void setMaxGrade(int maxGrade) {
        this.maxGrade = maxGrade;
    }

    public int getMinGrade() {
        return minGrade;
    }

    public void setMinGrade(int minGrade) {
        this.minGrade = minGrade;
    }

    public int getAverageGrade() {
        return AverageGrade;
    }

    public void setAverageGrade(int averageGrade) {
        AverageGrade = averageGrade;
    }
}
