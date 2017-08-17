package com.xdk78.nimebox.api;

import com.github.florent37.retrojsoup.RetroJsoup;
import com.github.florent37.retrojsoup.annotations.Select;
import com.xdk78.nimebox.model.Anime;
import com.xdk78.nimebox.model.AnimeList;
import com.xdk78.nimebox.model.Article;
import com.xdk78.nimebox.model.Episode;
import com.xdk78.nimebox.model.MangaList;

import io.reactivex.Observable;

/**
 * Created by xdk78 on 2017-05-23.
 */

public interface APIService {

    /* Article/News */

    @Select("div.card.medium")
    Observable<Article> articles();

    /* Anime */

    @Select("div.collection.row.anime-col")
    Observable<AnimeList> animeList();

    @Select("div.collection.row.anime-col")
    Observable<Anime> anime();

    @Select("div.video-container")
    Observable<Episode> episode();

    /* Manga */

    @Select("div.collection.row.manga-col")
    Observable<MangaList> mangaList();

    class Factory {
        static APIService create(String url) {
            return new RetroJsoup.Builder()
                    .url(url)
                    .build()
                    .create(APIService.class);
        }
    }
}