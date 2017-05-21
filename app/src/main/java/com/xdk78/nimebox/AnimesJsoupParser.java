package com.xdk78.nimebox;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.xdk78.nimebox.Adapter.AnimesAdapter;
import com.xdk78.nimebox.Model.Animes;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;

import static com.xdk78.nimebox.Utils.ANIME_URL;
import static com.xdk78.nimebox.Utils.BASE_URL;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class AnimesJsoupParser extends AsyncTask<Void, Void, Void> {

    @BindView(R.id.animes)
    RecyclerView recyclerView;
    private ArrayList<Animes> items;
    private Context context;
    private ProgressDialog mProgressDialog;
    private String title = null;
    private String newest_episode = null;
    private String anime_image = null;


    AnimesJsoupParser(Context context, View view) {
        this.context = context;
        ButterKnife.bind(this, view);
    }

    @Override
    public void onPreExecute() {
        super.onPreExecute();
        mProgressDialog = new ProgressDialog(context);
        mProgressDialog.setTitle("Nimebox");
        mProgressDialog.setMessage("Ładowanie...");
        mProgressDialog.setIndeterminate(false);
        mProgressDialog.setCancelable(false);
        mProgressDialog.show();
    }

    @Override
    public Void doInBackground(Void... params) {

        try {
            Document full;
            full = Jsoup.connect(ANIME_URL).userAgent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36").ignoreHttpErrors(true).get();

            Elements animes = full.select("div.collection.row.anime-col"); //Divide html to threads

            items = new ArrayList<>();

            for (Element anime : animes) {
                Elements item = anime.select("a.collection-item.anime-item.col.l6.m6.s12");
                for (Element itemsy : item) {
                    Elements desc = itemsy.select("div.anime-desc");

                    title = desc.select("span.title.anime-title").text();
                    newest_episode = desc.select("span.grey-text.text-lighten-1").text();
                    anime_image = itemsy.select("img[src]").attr("src");

                    items.add(new Animes(title, newest_episode, (BASE_URL + anime_image.replace(" ", "%20")), context));
                }

            }


        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public void onPostExecute(Void result) {
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(context));
        recyclerView.setItemAnimator(new DefaultItemAnimator());

        AnimesAdapter adapter = new AnimesAdapter(items, context);
        recyclerView.setAdapter(adapter);
        mProgressDialog.dismiss();

    }


}

