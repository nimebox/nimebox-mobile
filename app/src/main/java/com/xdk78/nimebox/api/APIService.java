package com.xdk78.nimebox.api;

import com.github.florent37.retrojsoup.annotations.Select;
import com.xdk78.nimebox.model.Anime;
import com.xdk78.nimebox.model.AnimeList;
import com.xdk78.nimebox.model.Article;
import com.xdk78.nimebox.model.Episode;

import io.reactivex.Observable;

/**
 * Created by xdk78 on 2017-05-23.
 */

public interface APIService {

    @Select("div.collection.row.anime-col")
    Observable<AnimeList> animeList();

    @Select("div.collection.row.anime-col")
    Observable<Anime> anime();

    @Select("div.video-container")
    Observable<Episode> episode();

    @Select("div.card.medium")
    Observable<Article> articles();

}