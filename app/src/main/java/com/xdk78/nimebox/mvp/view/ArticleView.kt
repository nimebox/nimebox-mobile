package com.xdk78.nimebox.mvp.view

import com.xdk78.nimebox.mvp.model.ArticleModel


/**
 * Created by xdk78 on 2017-12-02.
 */
interface ArticleView {

    fun onItemLoaded(items: MutableList<ArticleModel>)

    fun onError(throwable: Throwable?)

}