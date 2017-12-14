package com.xdk78.nimebox.mvp.view

import com.xdk78.nimebox.mvp.model.AnimeListModel


/**
 * Created by xdk78 on 2017-12-02.
 */
interface AnimeListView {

    fun onItemLoaded(items: MutableList<AnimeListModel>)

    fun onError(throwable: Throwable?)

}