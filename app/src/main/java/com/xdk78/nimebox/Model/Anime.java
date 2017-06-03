package com.xdk78.nimebox.Model;

import android.content.Context;

import com.github.florent37.retrojsoup.annotations.JsoupHref;
import com.github.florent37.retrojsoup.annotations.JsoupText;


/**
 * Created by xdk78 on 2017-05-21.
 */

public class Anime {


    @JsoupText("h5")
    String episodeNumber;

    @JsoupHref("a.collection-item.anime-item")
    String episodeUrl;

    Context context;

    public Anime() {

    }

    public String getEpisodeNumber() {
        return episodeNumber;
    }

    public void setEpisodeNumber(String episodeNumber) {
        this.episodeNumber = episodeNumber;
    }

    public String getEpisodeUrl() {
        return episodeUrl;
    }

    public void setEpisodeUrl(String episodeUrl) {
        this.episodeUrl = episodeUrl;
    }
}
