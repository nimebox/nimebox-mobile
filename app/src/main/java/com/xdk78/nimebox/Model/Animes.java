package com.xdk78.nimebox.Model;

import android.content.Context;

/**
 * Created by xdk78 on 2017-05-21.
 */

public class Animes {

    private String title;
    private String newest_episode;
    private String anime_image;
    private Context context;


    public Animes() {


    }

    public Animes(String title, String newest_episode, String anime_image, Context context) {
        this.title = title;
        this.newest_episode = newest_episode;
        this.anime_image = anime_image;
        this.context = context;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNewest_episode() {
        return newest_episode;
    }

    public void setNewest_episode(String newest_episode) {
        this.newest_episode = newest_episode;
    }

    public String getAnime_image() {
        return anime_image;
    }

    public void setAnime_image(String anime_image) {
        this.anime_image = anime_image;
    }
}
