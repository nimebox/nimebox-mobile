package com.xdk78.nimebox.mvp.presenter

import com.xdk78.nimebox.api.MainApi
import com.xdk78.nimebox.base.BasePresenter
import com.xdk78.nimebox.mvp.view.NewsView
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers


class NewsPresenter(val mainApi: MainApi) : BasePresenter<NewsView>() {

    fun loadData() {
        compositeObservable.add(
                mainApi
                        .getNews()
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribeOn(Schedulers.io())
                        .subscribe(
                                { items -> view?.onItemLoaded(items) },
                                { error -> view?.onError(error) })
        )
    }
}
