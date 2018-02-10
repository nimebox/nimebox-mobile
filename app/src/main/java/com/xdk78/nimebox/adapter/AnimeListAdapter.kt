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
import com.xdk78.nimebox.mvp.model.AnimeListModel
import org.jetbrains.anko.find


class AnimeListAdapter(var context: Context, private var items: List<AnimeListModel>) : RecyclerView.Adapter<AnimeListAdapter.AnimeListAdapterViewHolder>() {

    override fun onBindViewHolder(holder: AnimeListAdapterViewHolder, position: Int) {
        val items = items[position]
        holder.title.text = items.title

        Glide.with(context)
                .load(items.image)
                .into(holder.image)

        holder.description.text = items.description
    }

    override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): AnimeListAdapterViewHolder {
        val layoutInflater = LayoutInflater.from(parent?.context)
        return AnimeListAdapterViewHolder(layoutInflater.inflate(R.layout.anime_list_layout, parent, false))
    }

    override fun getItemCount(): Int {
        return items.size
    }

    class AnimeListAdapterViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val title: TextView = view.find(R.id.anime_title)
        val description: TextView = view.find(R.id.anime_description)
        val image: ImageView = view.find(R.id.anime_image)
    }
}