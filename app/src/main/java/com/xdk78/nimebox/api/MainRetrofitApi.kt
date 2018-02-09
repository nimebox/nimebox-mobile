package com.xdk78.nimebox.api

import com.xdk78.nimebox.mvp.model.NewsModel
import io.reactivex.Single
import retrofit2.http.GET
import retrofit2.http.Headers


interface MainRetrofitApi {
    @Headers("Authorization:Bearer " + ApiConstants.BEARER_TOKEN)
    @GET("v1/news")
    fun getNews(): Single<List<NewsModel>>
}