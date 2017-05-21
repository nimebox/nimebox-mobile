package com.xdk78.nimebox.Adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.koushikdutta.ion.Ion;
import com.xdk78.nimebox.Model.Animes;
import com.xdk78.nimebox.R;

import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class AnimesAdapter extends RecyclerView.Adapter {

    private ArrayList<Animes> items;
    private Context context;

    public AnimesAdapter(ArrayList<Animes> items, Context context) {
        this.items = items;
        this.context = context;
    }


    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.animes_layout, viewGroup, false);
        return new mViewHolder(view);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, final int i) {
        Animes item = items.get(i);

        ((mViewHolder) viewHolder).title.setText(item.getTitle());
        ((mViewHolder) viewHolder).newest_episode.setText(item.getNewest_episode());

        Ion.with(context)
                .load(item.getAnime_image())
                .userAgent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36")
                .intoImageView(((mViewHolder) viewHolder).anime_image);
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class mViewHolder extends RecyclerView.ViewHolder {


        @BindView(R.id.anime_title)
        TextView title;

        @BindView(R.id.anime_newest_episode)
        TextView newest_episode;

        @BindView(R.id.anime_image)
        ImageView anime_image;

        public mViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);

        }
    }
}
