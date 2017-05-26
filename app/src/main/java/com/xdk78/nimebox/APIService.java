package com.xdk78.nimebox;

import com.github.florent37.retrojsoup.annotations.Select;
import com.xdk78.nimebox.Model.Animes;
import com.xdk78.nimebox.Model.Article;

import io.reactivex.Observable;

/**
 * Created by xdk78 on 2017-05-23.
 */

public interface APIService {

    @Select("a.collection-item.anime-item.col.l6.m6.s12")
    Observable<Animes> animes();

    @Select("div.card.medium")
    Observable<Article> articles();

}
