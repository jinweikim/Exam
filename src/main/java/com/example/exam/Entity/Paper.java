package com.example.exam.Entity;

import java.util.ArrayList;
import java.util.List;

public class Paper{

    private int group;
    private int que_id;
    private int paper_id;
    private ArrayList<Questions> list;
    private int size;
    private String name;

    public Paper(){
        list = new ArrayList<>();
        if(!list.isEmpty()){
            size = list.size();
        }
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }

    public List<Questions> getList() {
        return list;
    }

    public void setList(ArrayList<Questions> list) {
        this.list = list;
    }

    public int getSize() {
        if(!list.isEmpty()){
            size = list.size();
        }
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQue_id() {
        return que_id;
    }

    public void setQue_id(int que_id) {
        this.que_id = que_id;
    }

    public int getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(int paper_id) {
        this.paper_id = paper_id;
    }
}
