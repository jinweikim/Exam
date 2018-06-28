package com.example.exam.Entity;

import java.util.ArrayList;
import java.util.List;

public class Papers {

    private String group;
    private ArrayList<Questions> list;
    private int size;
    private String name;

    public Papers(){
        list = new ArrayList<>();
        if(!list.isEmpty()){
            size = list.size();
        }
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
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
}
