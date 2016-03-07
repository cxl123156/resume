package com.resume.entity;

/**
 * Created by chen9 on 2015/11/23.
 */
public class Role {
    private int id;
    private String role;      //Ȩ��
    private String descpt;    //����
    private String category;  //����

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDescpt() {
        return descpt;
    }

    public void setDescpt(String descpt) {
        this.descpt = descpt;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
