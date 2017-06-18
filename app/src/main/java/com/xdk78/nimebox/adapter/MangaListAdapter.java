package com.xdk78.nimebox.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.xdk78.nimebox.R;
import com.xdk78.nimebox.model.MangaList;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

import static com.xdk78.nimebox.util.Utils.BASE_URL;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class MangaListAdapter extends RecyclerView.Adapter<MangaListAdapter.MangaListViewHolder> {

    private List<MangaList> items = new ArrayList<>();
    private Context context;

    public MangaListAdapter(List<MangaList> items, Context context) {
        this.items = items;
        this.context = context;
    }

    public void addItems(List<MangaList> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    @Override
    public MangaListViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.manga_list_layout, viewGroup, false);
        return new MangaListViewHolder(view);
    }

    @Override
    public void onBindViewHolder(MangaListViewHolder viewHolder, final int i) {
        MangaList item = items.get(i);

        viewHolder.title.setText(item.getTitle());
        viewHolder.newest_chapter.setText(item.getNewestChapter());

        Glide.with(context)
                .asDrawable()
                .load(BASE_URL + item.getMangaImage().replace(" ", "%20"))
                .into((viewHolder).manga_image);

        /*viewHolder.itemView.setOnClickListener(view -> {
            Intent intent = new Intent(context, MangaActivity.class);
            intent.addFlags(FLAG_ACTIVITY_NEW_TASK);
            intent.putExtra("mangaUrl", (BASE_URL + item.getMangaUrl().replace(" ", "%20")));
            intent.putExtra("mangaTitle", item.getTitle());
            context.startActivity(intent);

        });
        */
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class MangaListViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.manga_title)
        TextView title;

        @BindView(R.id.manga_newest_chapter)
        TextView newest_chapter;

        @BindView(R.id.manga_image)
        ImageView manga_image;

        public MangaListViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);

        }
    }
}
