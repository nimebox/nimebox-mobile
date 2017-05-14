package com.xdk78.nimebox;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.xdk78.nimebox.Adapter.ArticleAdapter;
import com.xdk78.nimebox.Model.Article;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by xdk78 on 2017-05-14.
 */

public class JsoupParser extends AsyncTask<Void, Void, Void> {

    public static String BASE_URL = "http://www.senpai.com.pl";
    private ArrayList<Article> items;
    private Context context;
    private ProgressDialog mProgressDialog;
    public String pageTitle;


    @BindView(R.id.articles)
    RecyclerView recyclerView;


    JsoupParser(Context context, View view) {
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
        //mProgressDialog.setCancelable(false);
        mProgressDialog.show();
    }

    @Override
    public Void doInBackground(Void... params) {

        try {
            Document full;
            full = Jsoup.connect(BASE_URL).userAgent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36").ignoreHttpErrors(true).get();

                Elements articles = full.select("div.col.s12.m7.l8"); //Divide html to threads

                items = new ArrayList<>();

                for (Element article : articles) {
                    Elements card = article.select("div.card.medium");

                    for (Element cards : card) {
                        Elements imagecard = cards.select("div.card-image");

                        String title = null;
                        String desciption = null;
                        for (Element imagecards : imagecard) {
                            title = imagecards.select("span.card-title").text();
                        }

                        desciption = cards.select("div.card-content").text();

                        items.add(new Article(title, desciption, context));
                    }
                }

                // Get title
                pageTitle = full.title();


        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    public void onPostExecute(Void result) {
            recyclerView.setHasFixedSize(true);
            recyclerView.setLayoutManager(new LinearLayoutManager(context));
            recyclerView.setItemAnimator(new DefaultItemAnimator());

            ArticleAdapter adapter = new ArticleAdapter(items, context);
            recyclerView.setAdapter(adapter);
            mProgressDialog.dismiss();

    }


}

