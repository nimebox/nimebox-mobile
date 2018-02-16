package com.xdk78.nimebox.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.xdk78.nimebox.R
import com.xdk78.nimebox.mvp.model.AnimeListModel
import com.xdk78.nimebox.util.loadImage
import kotlinx.android.synthetic.main.anime_list_layout.view.*


class AnimeListAdapter(var context: Context, private var items: List<AnimeListModel>) : RecyclerView.Adapter<AnimeListAdapter.AnimeListAdapterViewHolder>() {

    override fun onBindViewHolder(holder: AnimeListAdapterViewHolder, position: Int) {
        val items = items[position]
        holder.itemView.anime_title.text = items.title
        holder.itemView.anime_description.text = items.description
        holder.itemView.anime_image.loadImage(items.image)
    }

    override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): AnimeListAdapterViewHolder {
        val layoutInflater = LayoutInflater.from(parent?.context)
        return AnimeListAdapterViewHolder(layoutInflater.inflate(R.layout.anime_list_layout, parent, false))
    }

    override fun getItemCount(): Int {
        return items.size
    }

    class AnimeListAdapterViewHolder(view: View) : RecyclerView.ViewHolder(view)

}