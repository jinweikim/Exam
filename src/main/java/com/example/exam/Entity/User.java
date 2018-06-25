package com.example.exam.Entity;

public class User {
    private String id;
    private String username;
    private String password;
    private int grade;
    private String userClass;

    public User(){

    }

    public User(String id,String username,String password,int grade,String userClass){
        this.id = id;
        this.username = username;
        this.password = password;
        this.grade = grade;
        this.userClass = userClass;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getUserClass() {
        return userClass;
    }

    public void setUserClass(String userClass) {
        this.userClass = userClass;
    }
}
