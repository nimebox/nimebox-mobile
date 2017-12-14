package com.xdk78.nimebox.di.module.api

import com.xdk78.nimebox.mvp.model.AnimeListModel
import com.xdk78.nimebox.mvp.model.ArticleModel
import io.reactivex.Observable


/**
 * Created by xdk78 on 2017-11-05.
 */

class ApiRepository(private var apiService: ApiService) {

    fun getNews(): Observable<MutableList<ArticleModel>> = apiService.getNews()
    fun getAnimeList(): Observable<MutableList<AnimeListModel>> = apiService.getAnimeList()
}