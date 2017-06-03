package com.xdk78.nimebox;

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
import com.xdk78.nimebox.Adapter.EpisodeAdapter;
import com.xdk78.nimebox.Model.Episode;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;

public class EpisodeActivity extends AppCompatActivity {

    private static Context context;
    String episodeUrl;
    String episodeNumber;
    private RecyclerView recyclerView;
    private EpisodeAdapter adapter;
    private List<Episode> episodes;
    private Unbinder unbinder;
    private View view;
    private Drawer result = null;

    public static Context getContext() {
        return context;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_episode);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        //set the back arrow in the toolbar
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        episodeNumber = (String) getIntent().getSerializableExtra("episodeNumber");
        getSupportActionBar().setTitle(episodeNumber);

        toolbar.setNavigationOnClickListener(view1 -> onBackPressed());

        context = getApplicationContext();
        unbinder = ButterKnife.bind(this);

        result = new DrawerBuilder()
                .withActivity(this)
                .withToolbar(toolbar)
                .withSavedInstance(savedInstanceState)
                .buildView();

        recyclerView = (RecyclerView) findViewById(R.id.episode);

        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new EpisodeAdapter(episodes = new ArrayList<>(), this);
        recyclerView.setAdapter(adapter);

        loadEpisodeAPI();
    }

    public void loadEpisodeAPI() {
        final OkHttpClient okHttpClient = new OkHttpClient();
        episodeUrl = (String) getIntent().getSerializableExtra("episodeUrl");
        final APIService episodeAPI = new RetroJsoup.Builder()
                .url(episodeUrl)
                .client(okHttpClient)
                .build()
                .create(APIService.class);

        episodeAPI.episode()
                .toList()
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new SingleObserver<List<Episode>>() {
                                   @Override
                                   public void onSubscribe(Disposable d) {

                                   }

                                   @Override
                                   public void onSuccess(List<Episode> episodes) {
                                       adapter.addItems(episodes);
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
