package com.xdk78.nimebox.Model;

import android.content.Context;

import com.github.florent37.retrojsoup.annotations.JsoupAttr;
import com.github.florent37.retrojsoup.annotations.JsoupText;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class Article {

    @JsoupText("span.card-title")
    String title;

    @JsoupText("div.card-content")
    String description;

    @JsoupAttr(value = "img[src]", attr = "src")
    String image;

    Context context;

    public Article(){

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
