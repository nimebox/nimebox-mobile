package com.xdk78.nimebox.mvp.presenter

import com.xdk78.nimebox.api.MainApi
import com.xdk78.nimebox.base.BasePresenter
import com.xdk78.nimebox.base.Schedulers
import com.xdk78.nimebox.mvp.view.AnimeListView


class AnimeListPresenter(val schedulers: Schedulers, val mainApi: MainApi) : BasePresenter<AnimeListView>() {

    fun loadData() {
        compositeObservable.add(
                mainApi
                        .getAnimeList()
                        .observeOn(schedulers.mainThread())
                        .subscribeOn(schedulers.backgroundThread())
                        .subscribe(
                                { items -> view?.onItemLoaded(items) },
                                { error -> view?.onError(error) })
        )
    }
}
