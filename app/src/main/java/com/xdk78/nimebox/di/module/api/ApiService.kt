package com.xdk78.nimebox.di.module.api

/**
 * Created by obsidiam on 11/1/17.
 */

import com.xdk78.nimebox.mvp.model.AnimeListModel
import com.xdk78.nimebox.mvp.model.ArticleModel
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Headers


interface ApiService {

    @Headers("Authorization:Bearer " + ApiConstants.BEARER_TOKEN)
    @GET("v1/news")
    fun getNews(): Observable<MutableList<ArticleModel>>

    @Headers("Authorization:Bearer " + ApiConstants.BEARER_TOKEN)
    @GET("v1/anime")
    fun getAnimeList(): Observable<MutableList<AnimeListModel>>

}
