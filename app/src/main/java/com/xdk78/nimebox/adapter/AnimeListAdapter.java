package com.xdk78.nimebox.adapter;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.xdk78.nimebox.R;
import com.xdk78.nimebox.model.AnimeList;
import com.xdk78.nimebox.ui.AnimeActivity;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

import static android.content.Intent.FLAG_ACTIVITY_NEW_TASK;
import static com.xdk78.nimebox.util.Utils.BASE_URL;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class AnimeListAdapter extends RecyclerView.Adapter<AnimeListAdapter.AnimeListViewHolder> {

    private List<AnimeList> items = new ArrayList<>();
    private Context context;

    public AnimeListAdapter(List<AnimeList> items, Context context) {
        this.items = items;
        this.context = context;
    }

    public void addItems(List<AnimeList> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    @Override
    public AnimeListViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.anime_list_layout, viewGroup, false);
        return new AnimeListViewHolder(view);
    }

    @Override
    public void onBindViewHolder(AnimeListViewHolder viewHolder, final int i) {
        AnimeList item = items.get(i);

        viewHolder.title.setText(item.getTitle());
        viewHolder.newest_episode.setText(item.getNewestEpisode());

        Glide.with(context)
                .asDrawable()
                .load(BASE_URL + item.getAnimeImage().replace(" ", "%20"))
                .into((viewHolder).anime_image);

        viewHolder.itemView.setOnClickListener(view -> {
            Intent intent = new Intent(context, AnimeActivity.class);
            intent.addFlags(FLAG_ACTIVITY_NEW_TASK);
            intent.putExtra("animeUrl", (BASE_URL + item.getAnimeUrl().replace(" ", "%20")));
            intent.putExtra("animeTitle", item.getTitle());
            context.startActivity(intent);

        });
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class AnimeListViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.anime_title)
        TextView title;

        @BindView(R.id.anime_newest_episode)
        TextView newest_episode;

        @BindView(R.id.anime_image)
        ImageView anime_image;

        public AnimeListViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);

        }
    }
}
