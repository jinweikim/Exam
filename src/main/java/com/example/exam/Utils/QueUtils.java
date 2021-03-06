package com.example.exam.Utils;

import com.example.exam.Entity.Paper;
import com.example.exam.Entity.Questions;
import com.example.exam.Interceptor.SessionInterceptor;
import com.example.exam.Service.QueService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class QueUtils {

    private final static Logger logger = LoggerFactory.getLogger(QueUtils.class);

    @Autowired
    private QueService queService;

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

    public static ArrayList<Paper> Que2Paper(ArrayList<Questions> list,int Group){
        ArrayList<Paper> newList = new ArrayList<>();
        for(Questions q:list){
            Paper paper = new Paper();
            paper.setQue_id(q.getQue_id());
            paper.setGroup(Group);
            newList.add(paper);
        }
        return newList;
    }

//    public ArrayList<Questions> Paper2Que(ArrayList<Paper> list){
//        ArrayList<Questions> newList = new ArrayList<>();
//
//        Questions que1 = queService.getOptById(5);
//        for(Paper p:list){
//            logger.info("每个que的id: "+p.getQue_id());
//            Questions que = queService.getOptById(5);
//            logger.info("que题干: "+ que.getQue_head());
//            //que = queService.getOptById(p.getQue_id());
//            if(que != null){
//                newList.add(que);
//            }else{
//                que = queService.getBlankById(p.getQue_id());
//                if(que != null){
//                    newList.add(que);
//                }
//            }
//        }
//        return newList;
//    }


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
