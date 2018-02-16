package com.xdk78.nimebox.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.xdk78.nimebox.R
import com.xdk78.nimebox.mvp.model.NewsModel
import com.xdk78.nimebox.util.loadImage
import kotlinx.android.synthetic.main.article_item.view.*

class NewsAdapter(var context: Context, private var items: List<NewsModel>) : RecyclerView.Adapter<NewsAdapter.ArticleAdapterViewHolder>() {

    override fun onBindViewHolder(holder: ArticleAdapterViewHolder, position: Int) {
        val items = items[position]
        holder.itemView.article_title.text = items.title
        holder.itemView.article_description.text = items.description
        holder.itemView.article_image.loadImage(items.image)
    }

    override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): ArticleAdapterViewHolder {
        val layoutInflater = LayoutInflater.from(parent?.context)
        return ArticleAdapterViewHolder(layoutInflater.inflate(R.layout.article_item, parent, false))
    }

    override fun getItemCount(): Int {
        return items.size
    }

    class ArticleAdapterViewHolder(view: View) : RecyclerView.ViewHolder(view)

}