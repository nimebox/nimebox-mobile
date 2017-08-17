package com.xdk78.nimebox.ui;

import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.DrawerBuilder;
import com.xdk78.nimebox.R;
import com.xdk78.nimebox.adapter.EpisodeAdapter;
import com.xdk78.nimebox.api.RepositoryProvider;
import com.xdk78.nimebox.model.Episode;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

public class EpisodeActivity extends AppCompatActivity {

    private String episodeUrl;
    private String episodeNumber;
    private RecyclerView recyclerView;
    private EpisodeAdapter adapter;
    private List<Episode> episodes;
    private Unbinder unbinder;
    private View view;
    private Drawer result = null;
    private CompositeDisposable compositeDisposable = new CompositeDisposable();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_episode);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        //set the back arrow in the toolbar
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        episodeNumber = (String) getIntent().getSerializableExtra("episodeNumber");
        getSupportActionBar().setTitle(episodeNumber);

        toolbar.setNavigationOnClickListener(view1 -> onBackPressed());
        unbinder = ButterKnife.bind(this);

        result = new DrawerBuilder()
                .withActivity(this)
                .withToolbar(toolbar)
                .withSavedInstance(savedInstanceState)
                .buildView();

        recyclerView = findViewById(R.id.episode);

        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new EpisodeAdapter(episodes = new ArrayList<>(), this);
        recyclerView.setAdapter(adapter);

        loadAPI();
    }

    public void loadAPI() {
        episodeUrl = (String) getIntent().getSerializableExtra("episodeUrl");
        RepositoryProvider repository = new RepositoryProvider();
        compositeDisposable.add(
                repository.provideRepository(episodeUrl).getEpisode()
                        .toList()
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribeOn(Schedulers.io())
                        .subscribe(
                                episodes -> adapter.addItems(episodes),
                                e -> Snackbar.make(view, e.toString(), Snackbar.LENGTH_LONG).show()
                        )
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
