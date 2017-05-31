package com.xdk78.nimebox.Model;

import android.content.Context;

import com.github.florent37.retrojsoup.annotations.JsoupText;


/**
 * Created by xdk78 on 2017-05-21.
 */

public class Anime {


    @JsoupText("h5")
    String episodeNumber;

    Context context;

    public Anime() {

    }

    public String getEpisodeNumber() {
        return episodeNumber;
    }

    public void setEpisodeNumber(String episodeNumber) {
        this.episodeNumber = episodeNumber;
    }
}
