package com.xdk78.nimebox.Model;

import android.content.Context;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class Article {


    private String title;
    private String description;
    private Context context;

    public Article(){

    }

    public Article(String title, String description, Context context){
        this.title=title;
        this.description=description;
        this.context=context;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
