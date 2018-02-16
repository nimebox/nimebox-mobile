package com.xdk78.nimebox.util

import android.widget.ImageView
import com.bumptech.glide.Glide


fun ImageView.loadImage(url: String?) {
    Glide.with(context)
            .asDrawable()
            .load(url)
            .into(this)
}