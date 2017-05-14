package com.xdk78.nimebox.Adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.xdk78.nimebox.Model.Article;
import com.xdk78.nimebox.R;

import java.util.ArrayList;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class ArticleAdapter extends RecyclerView.Adapter {

    private ArrayList<Article> items;
    private Context context;

    public ArticleAdapter(ArrayList<Article> items, Context context) {
        this.items = items;
        this.context = context;
    }


    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.article_layout, viewGroup, false);
        return new mViewHolder(view);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, final int i) {
        Article item = items.get(i);

        ((mViewHolder) viewHolder).title.setText(item.getTitle());
        ((mViewHolder) viewHolder).description.setText(item.getDescription());

    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    private class mViewHolder extends RecyclerView.ViewHolder {
        public TextView title;
        public TextView description;

        public mViewHolder(View pItem) {
            super(pItem);
            title = (TextView) pItem.findViewById(R.id.article_title);
            description = (TextView) pItem.findViewById(R.id.article_description);
        }
    }
}
