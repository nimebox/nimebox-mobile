package com.xdk78.nimebox.model;


import com.github.florent37.retrojsoup.annotations.JsoupSrc;


/**
 * Created by xdk78 on 2017-06-03.
 */

public class Episode {


    @JsoupSrc("IFRAME")
    String playerUrl;

    public Episode() {

    }

    public String getPlayerUrl() {
        return playerUrl;
    }

    public void setPlayerUrl(String playerUrl) {
        this.playerUrl = playerUrl;
    }

}
