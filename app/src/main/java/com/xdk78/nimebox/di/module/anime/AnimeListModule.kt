package com.xdk78.nimebox.di.module.anime

import com.xdk78.nimebox.api.MainApi
import com.xdk78.nimebox.base.Schedulers
import com.xdk78.nimebox.mvp.presenter.AnimeListPresenter
import dagger.Module
import dagger.Provides


@Module
class AnimeListModule {
    @Provides
    fun provideAnimeListPresenter(schedulers: Schedulers, mainApi: MainApi) = AnimeListPresenter(schedulers, mainApi)

}