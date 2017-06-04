package com.xdk78.nimebox.model;

import android.content.Context;

import com.github.florent37.retrojsoup.annotations.JsoupAttr;
import com.github.florent37.retrojsoup.annotations.JsoupHref;
import com.github.florent37.retrojsoup.annotations.JsoupText;


/**
 * Created by xdk78 on 2017-05-21.
 */

public class AnimeList {

    @JsoupText("span.title.anime-title")
    String title;

    @JsoupText("span.grey-text.text-lighten-1")
    String newestEpisode;

    @JsoupAttr(value = "img[src]", attr = "src")
    String animeImage;

    @JsoupHref("a.collection-item.anime-item.col.l6.m6.s12")
    String animeUrl;

    Context context;

    public AnimeList() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNewestEpisode() {
        return newestEpisode;
    }

    public void setNewestEpisode(String newestEpisode) {
        this.newestEpisode = newestEpisode;
    }

    public String getAnimeImage() {
        return animeImage;
    }

    public void setAnimeImage(String animeImage) {
        this.animeImage = animeImage;
    }

    public String getAnimeUrl() {
        return animeUrl;
    }

    public void setAnimeUrle(String animeUrl) {
        this.animeUrl = animeUrl;
    }

}
