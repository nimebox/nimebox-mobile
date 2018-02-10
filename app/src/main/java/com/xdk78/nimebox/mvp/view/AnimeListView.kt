package com.xdk78.nimebox.mvp.view

import com.xdk78.nimebox.base.BaseView
import com.xdk78.nimebox.mvp.model.AnimeListModel

interface AnimeListView : BaseView {

    fun onItemLoaded(items: List<AnimeListModel>)

}