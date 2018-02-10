package com.xdk78.nimebox.api

import com.xdk78.nimebox.mvp.model.AnimeListModel
import com.xdk78.nimebox.mvp.model.NewsModel
import io.reactivex.Single


interface MainApi {
    fun getNews(): Single<List<NewsModel>>
    fun getAnimeList(): Single<List<AnimeListModel>>
}