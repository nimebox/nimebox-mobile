package com.xdk78.nimebox.Model;

import android.content.Context;

import com.github.florent37.retrojsoup.annotations.JsoupSrc;


/**
 * Created by xdk78 on 2017-06-03.
 */

public class Episode {


    @JsoupSrc("IFRAME")
    String playerUrl;

    Context context;

    public Episode() {

    }

    public String getPlayerUrl() {
        return playerUrl;
    }

    public void setPlayerUrl(String playerUrl) {
        this.playerUrl = playerUrl;
    }

}
