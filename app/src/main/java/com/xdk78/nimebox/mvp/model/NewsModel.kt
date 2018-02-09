package com.xdk78.nimebox.mvp.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class NewsModel(
        @SerializedName("title") @Expose var title: String?,
        @SerializedName("url") @Expose var url: String?,
        @SerializedName("date") @Expose var date: String?,
        @SerializedName("description") @Expose var description: String?,
        @SerializedName("image") @Expose var image: String?
)
