package com.xdk78.nimebox.model;


import com.github.florent37.retrojsoup.annotations.JsoupAttr;
import com.github.florent37.retrojsoup.annotations.JsoupHref;
import com.github.florent37.retrojsoup.annotations.JsoupText;

/**
 * Created by xdk78 on 2017-06-18.
 */

public class MangaList {

    @JsoupText("span.title.manga-title")
    String title;

    @JsoupText("span.grey-text.text-lighten-1")
    String newestChapter;

    @JsoupAttr(value = "img[src]", attr = "src")
    String mangaImage;

    @JsoupHref("a.collection-item.manga-item.col.l6.m6.s12")
    String mangaUrl;

    public MangaList() {

    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNewestChapter() {
        return newestChapter;
    }

    public void setNewestChaptere(String newestChapter) {
        this.newestChapter = newestChapter;
    }

    public String getMangaImage() {
        return mangaImage;
    }

    public void setMangaImage(String mangaImage) {
        this.mangaImage = mangaImage;
    }

    public String getMangaUrl() {
        return mangaUrl;
    }

    public void setMangaUrl(String mangaUrl) {
        this.mangaUrl = mangaUrl;
    }

}
