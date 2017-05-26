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
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

import static com.xdk78.nimebox.Utils.BASE_URL;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class AnimesAdapter extends RecyclerView.Adapter<AnimesAdapter.AnimesViewHolder> {

    private List<Animes> items = new ArrayList<>();
    private Context context;

    public AnimesAdapter(List<Animes> items, Context context) {
        this.items = items;
        this.context = context;
    }

    public void addItems(List<Animes> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    @Override
    public AnimesViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.animes_layout, viewGroup, false);
        return new AnimesViewHolder(view);
    }

    @Override
    public void onBindViewHolder(AnimesViewHolder viewHolder, final int i) {
        Animes item = items.get(i);

        viewHolder.title.setText(item.getTitle());
        viewHolder.newest_episode.setText(item.getNewest_episode());
        Ion.with((viewHolder).anime_image)
                .load(BASE_URL + item.getAnime_image().replace(" ", "%20"));

    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class AnimesViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.anime_title)
        TextView title;

        @BindView(R.id.anime_newest_episode)
        TextView newest_episode;

        @BindView(R.id.anime_image)
        ImageView anime_image;

        public AnimesViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);

        }
    }
}
