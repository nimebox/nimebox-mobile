package com.xdk78.nimebox.api;

import com.xdk78.nimebox.model.Anime;
import com.xdk78.nimebox.model.AnimeList;
import com.xdk78.nimebox.model.Article;
import com.xdk78.nimebox.model.Episode;
import com.xdk78.nimebox.model.MangaList;

import io.reactivex.Observable;

/**
 * Created by xdk78 on 2017-08-17.
 */

public class Repository {

    private APIService apiService;

    public Repository(APIService apiService) {
        this.apiService = apiService;
    }

    public Observable<Article> getArticles() {
        return apiService.articles();
    }

    public Observable<AnimeList> getAnimeList() {
        return apiService.animeList();
    }

    public Observable<Anime> getAnime() {
        return apiService.anime();
    }

    public Observable<Episode> getEpisode() {
        return apiService.episode();
    }

    public Observable<MangaList> getMangaList() {
        return apiService.mangaList();
    }

}
