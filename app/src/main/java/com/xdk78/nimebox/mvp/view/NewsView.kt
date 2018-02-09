package com.xdk78.nimebox.mvp.view

import com.xdk78.nimebox.base.BaseView
import com.xdk78.nimebox.mvp.model.NewsModel

interface NewsView : BaseView {

    fun onItemLoaded(items: List<NewsModel>)

}