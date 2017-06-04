package com.xdk78.nimebox.ui;

import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.github.florent37.retrojsoup.RetroJsoup;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.DrawerBuilder;
import com.xdk78.nimebox.R;
import com.xdk78.nimebox.adapter.AnimeAdapter;
import com.xdk78.nimebox.api.APIService;
import com.xdk78.nimebox.model.Anime;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;

public class AnimeActivity extends AppCompatActivity {

    private static Context context;
    String animeUrl;
    String animeTitle;
    private RecyclerView recyclerView;
    private AnimeAdapter adapter;
    private List<Anime> anime;
    private Unbinder unbinder;
    private View view;
    private Drawer result = null;

    public static Context getContext() {
        return context;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_anime);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        //set the back arrow in the toolbar
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        animeTitle = (String) getIntent().getSerializableExtra("animeTitle");
        getSupportActionBar().setTitle(animeTitle);

        toolbar.setNavigationOnClickListener(view1 -> onBackPressed());

        context = getApplicationContext();
        unbinder = ButterKnife.bind(this);

        result = new DrawerBuilder()
                .withActivity(this)
                .withToolbar(toolbar)
                .withSavedInstance(savedInstanceState)
                .buildView();

        recyclerView = (RecyclerView) findViewById(R.id.anime);

        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new AnimeAdapter(anime = new ArrayList<>(), this);
        recyclerView.setAdapter(adapter);

        loadAnimeAPI();
    }

    public void loadAnimeAPI() {
        final OkHttpClient okHttpClient = new OkHttpClient();
        animeUrl = (String) getIntent().getSerializableExtra("animeUrl");
        final APIService animeAPI = new RetroJsoup.Builder()
                .url(animeUrl)
                .client(okHttpClient)
                .build()
                .create(APIService.class);

        animeAPI.anime()
                .toList()
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new SingleObserver<List<Anime>>() {
                                   @Override
                                   public void onSubscribe(Disposable d) {

                                   }

                                   @Override
                                   public void onSuccess(List<Anime> anime) {
                                       adapter.addItems(anime);
                                   }

                                   @Override
                                   public void onError(Throwable e) {
                                       Snackbar.make(view, e.toString(), Snackbar.LENGTH_LONG).show();
                                   }
                               }
                );
    }

    @Override
    public void onDestroy() {
        unbinder.unbind();
        super.onDestroy();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        //add the values which need to be saved from the drawer to the bundle
        outState = result.saveInstanceState(outState);
        super.onSaveInstanceState(outState);
    }

    @Override
    public void onBackPressed() {
        //handle the back press :D close the drawer first and if the drawer is closed close the activity
        if (result != null && result.isDrawerOpen()) {
            result.closeDrawer();
        } else {
            super.onBackPressed();
        }
    }
}
