package com.xdk78.nimebox.adapter;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.customtabs.CustomTabsIntent;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.xdk78.nimebox.R;
import com.xdk78.nimebox.model.Episode;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

import static android.content.Intent.FLAG_ACTIVITY_NEW_TASK;
import static com.xdk78.nimebox.ui.EpisodeActivity.getContext;


/**
 * Created by xdk78 on 2017-06-03.
 */

public class EpisodeAdapter extends RecyclerView.Adapter<EpisodeAdapter.EpisodeViewHolder> {

    private List<Episode> items = new ArrayList<>();
    private Context context;

    public EpisodeAdapter(List<Episode> items, Context context) {
        this.items = items;
        this.context = context;
    }

    public void addItems(List<Episode> items) {
        this.items.addAll(items);
        notifyDataSetChanged();
    }

    @Override
    public EpisodeViewHolder onCreateViewHolder(ViewGroup viewGroup, final int i) {
        View view = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.episode_layout, viewGroup, false);
        return new EpisodeViewHolder(view);
    }

    @Override
    public void onBindViewHolder(EpisodeViewHolder viewHolder, final int i) {
        Episode item = items.get(i);

        viewHolder.playerUrl.setText(item.getPlayerUrl());

        viewHolder.itemView.setOnClickListener(view -> {
            CustomTabsIntent.Builder builder = new CustomTabsIntent.Builder();
            builder.setToolbarColor(ContextCompat.getColor(context, R.color.colorPrimary));
            CustomTabsIntent customTabsIntent = builder.build();
            customTabsIntent.launchUrl(context, Uri.parse(item.getPlayerUrl()));
        });

    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class EpisodeViewHolder extends RecyclerView.ViewHolder implements View.OnCreateContextMenuListener {

        @BindView(R.id.playerUrl)
        TextView playerUrl;

        private MenuItem.OnMenuItemClickListener onEditMenu = new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case 0:
                        ClipboardManager myClickboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                        ClipData myClip = ClipData.newPlainText("text", playerUrl.getText().toString());
                        myClickboard.setPrimaryClip(myClip);
                        Toast.makeText(getContext(), "Skopiowano link", Toast.LENGTH_SHORT).show();
                        break;

                    case 1:
                        Intent shareIntent = new Intent(Intent.ACTION_SEND);
                        shareIntent.setType("text/plain");
                        shareIntent.putExtra(Intent.EXTRA_TEXT, playerUrl.getText());
                        shareIntent.addFlags(FLAG_ACTIVITY_NEW_TASK);
                        context.startActivity(Intent.createChooser(shareIntent, context.getResources().getText(R.string.share_link)));
                     break;

                }
                return true;
            }
        };

        public EpisodeViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
            view.setOnCreateContextMenuListener(this);
        }

        @Override
        public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo) {
            MenuItem CopyText = menu.add(0, 0, 0, "Kopiuj link");//groupId, itemId, order, title
            MenuItem ShareUrl = menu.add(0, 1, 0, "Udostępnij link");
            CopyText.setOnMenuItemClickListener(onEditMenu);
            ShareUrl.setOnMenuItemClickListener(onEditMenu);
        }


    }


}
