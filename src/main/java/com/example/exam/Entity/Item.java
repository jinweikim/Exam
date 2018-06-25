package com.example.exam.Entity;

public class Item {

    private int id;
    private String item_que;
    private String item_opt_a;
    private String item_opt_b;
    private String item_opt_c;
    private String item_opt_d;
    private String item_opt_e;
    private String item_opt_f;
    private String item_opt_g;
    private String item_ans;

    public Item(int id, String item_que, String item_opt_a, String item_opt_b, String item_opt_c, String item_opt_d, String item_opt_e, String item_opt_f, String item_opt_g, String item_ans) {
        this.id = id;
        this.item_que = item_que;
        this.item_opt_a = item_opt_a;
        this.item_opt_b = item_opt_b;
        this.item_opt_c = item_opt_c;
        this.item_opt_d = item_opt_d;
        this.item_opt_e = item_opt_e;
        this.item_opt_f = item_opt_f;
        this.item_opt_g = item_opt_g;
        this.item_ans = item_ans;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItem_que() {
        return item_que;
    }

    public void setItem_que(String item_que) {
        this.item_que = item_que;
    }

    public String getItem_opt_a() {
        return item_opt_a;
    }

    public void setItem_opt_a(String item_opt_a) {
        this.item_opt_a = item_opt_a;
    }

    public String getItem_opt_b() {
        return item_opt_b;
    }

    public void setItem_opt_b(String item_opt_b) {
        this.item_opt_b = item_opt_b;
    }

    public String getItem_opt_c() {
        return item_opt_c;
    }

    public void setItem_opt_c(String item_opt_c) {
        this.item_opt_c = item_opt_c;
    }

    public String getItem_opt_d() {
        return item_opt_d;
    }

    public void setItem_opt_d(String item_opt_d) {
        this.item_opt_d = item_opt_d;
    }

    public String getItem_opt_e() {
        return item_opt_e;
    }

    public void setItem_opt_e(String item_opt_e) {
        this.item_opt_e = item_opt_e;
    }

    public String getItem_opt_f() {
        return item_opt_f;
    }

    public void setItem_opt_f(String item_opt_f) {
        this.item_opt_f = item_opt_f;
    }

    public String getItem_opt_g() {
        return item_opt_g;
    }

    public void setItem_opt_g(String item_opt_g) {
        this.item_opt_g = item_opt_g;
    }

    public String getItem_ans() {
        return item_ans;
    }

    public void setItem_ans(String item_ans) {
        this.item_ans = item_ans;
    }
}
