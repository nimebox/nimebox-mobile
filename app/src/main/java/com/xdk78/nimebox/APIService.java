package com.xdk78.nimebox;

import com.github.florent37.retrojsoup.annotations.Select;
import com.xdk78.nimebox.Model.Anime;
import com.xdk78.nimebox.Model.AnimeList;
import com.xdk78.nimebox.Model.Article;

import io.reactivex.Observable;

/**
 * Created by xdk78 on 2017-05-23.
 */

public interface APIService {
    //collection row anime-col
    //@Select("a.collection-item.anime-item.col.l6.m6.s12")

    @Select("div.collection.row.anime-col")
    Observable<AnimeList> animeList();

    @Select("div.collection.row.anime-col")
    Observable<Anime> anime();

    @Select("div.card.medium")
    Observable<Article> articles();

}
