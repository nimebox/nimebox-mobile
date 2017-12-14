package com.xdk78.nimebox.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide
import com.xdk78.nimebox.R
import com.xdk78.nimebox.mvp.model.ArticleModel
import org.jetbrains.anko.find

/**
 * Created by obsidiam on 11/3/17.
 */
class ArticleAdapter(private var context: Context, private var items: MutableList<ArticleModel>) : RecyclerView.Adapter<ArticleAdapter.ArticleAdapterViewHolder>() {

    override fun onBindViewHolder(holder: ArticleAdapterViewHolder, position: Int) {
        val items = items[position]
        holder.title.text = items.title

        Glide.with(context)
                .load(items.image)
                .into(holder.image)

        holder.description.text = items.description
    }

    override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): ArticleAdapterViewHolder {
        val layoutInflater = LayoutInflater.from(parent?.context)
        return ArticleAdapterViewHolder(layoutInflater.inflate(R.layout.article_item, parent, false))
    }

    override fun getItemCount(): Int {
        return items.size
    }

    class ArticleAdapterViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val title: TextView = view.find(R.id.article_title)
        val description: TextView = view.find(R.id.article_description)
        val image: ImageView = view.find(R.id.article_image)
    }
}