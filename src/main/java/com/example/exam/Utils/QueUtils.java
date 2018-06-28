package com.example.exam.Utils;

import com.example.exam.Entity.Questions;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class QueUtils {

    public static ArrayList getRandomList(ArrayList<Questions> paramList,int count){
        if(paramList.size()<count){
            return paramList;
        }
        Random random = new Random();
        ArrayList<Integer> tempList  =  new ArrayList<>();
        ArrayList<Questions> newList = new ArrayList<>();
        int temp = 0;
        for(int i=0;i<count;i++){
            temp = random.nextInt(paramList.size());
            if(!tempList.contains(temp)){
                tempList.add(temp);
                newList.add(paramList.get(temp));
            }else{
                i--;
            }
        }
        return newList;
    }

    public static void main(String[] args){
        Questions que1 = new Questions();
        Questions que2 = new Questions();
        Questions que3 = new Questions();
        Questions que4 = new Questions();
        Questions que5 = new Questions();
        ArrayList<Questions> list = new ArrayList<>();
        list.add(que1);
        list.add(que2);
        list.add(que3);
        list.add(que4);
        list.add(que5);
        list = getRandomList(list,3);
        System.out.println(list.size());
    }

}
