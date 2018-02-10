package com.xdk78.nimebox.di.module.news

import com.xdk78.nimebox.api.MainApi
import com.xdk78.nimebox.base.Schedulers
import com.xdk78.nimebox.mvp.presenter.NewsPresenter
import dagger.Module
import dagger.Provides


@Module
class NewsModule {
    @Provides
    fun provideNewsPresenter(schedulers: Schedulers, mainApi: MainApi) = NewsPresenter(schedulers, mainApi)

}