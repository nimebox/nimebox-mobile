package com.xdk78.nimebox.api

import com.xdk78.nimebox.mvp.model.NewsModel
import io.reactivex.Single
import retrofit2.Retrofit


class MainRepository(val retrofit: Retrofit) : MainApi {

    private val mainApi by lazy { retrofit.create(MainRetrofitApi::class.java) }

    override fun getNews(): Single<List<NewsModel>> = mainApi.getNews()

}