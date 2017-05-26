package com.xdk78.nimebox.Adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.koushikdutta.ion.Ion;
import com.xdk78.nimebox.Model.Article;
import com.xdk78.nimebox.R;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class ArticleAdapter extends RecyclerView.Adapter<ArticleAdapter.ArticleiewHolder> {

    private List<Article> items = new ArrayList<>();
    private Context context;

    public ArticleAdapter(List<Article> items, Context context) {
        this.items = items;
        this.context = context;
    }

    public void addItems(List<Article> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    @Override
    public ArticleiewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.article_layout, viewGroup, false);
        return new ArticleiewHolder(view);
    }

    @Override
    public void onBindViewHolder(ArticleiewHolder viewHolder, final int i) {
        Article item = items.get(i);

        viewHolder.title.setText(item.getTitle());

        Ion.with((viewHolder).image)
                .load(item.getImage().replace(" ", "%20"));

        viewHolder.description.setText(item.getDescription());

    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class ArticleiewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.article_title)
        TextView title;

        @BindView(R.id.article_description)
        TextView description;

        @BindView(R.id.article_image)
        ImageView image;

        public ArticleiewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
        }
    }
}
