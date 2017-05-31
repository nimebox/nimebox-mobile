package com.xdk78.nimebox.Adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.xdk78.nimebox.Model.Anime;
import com.xdk78.nimebox.R;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class AnimeAdapter extends RecyclerView.Adapter<AnimeAdapter.AnimeViewHolder> {

    private List<Anime> items = new ArrayList<>();
    private Context context;

    public AnimeAdapter(List<Anime> items, Context context) {
        this.items = items;
        this.context = context;
    }

    public void addItems(List<Anime> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    @Override
    public AnimeViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.anime_layout, viewGroup, false);
        return new AnimeViewHolder(view);
    }

    @Override
    public void onBindViewHolder(AnimeViewHolder viewHolder, final int i) {
        Anime item = items.get(i);

        viewHolder.episodeNumber.setText(item.getEpisodeNumber());
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class AnimeViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.episodeNumber)
        TextView episodeNumber;


        public AnimeViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);

        }
    }
}
