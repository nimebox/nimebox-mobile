package com.xdk78.nimebox.ui;

import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.github.florent37.retrojsoup.RetroJsoup;
import com.xdk78.nimebox.R;
import com.xdk78.nimebox.adapter.AnimeListAdapter;
import com.xdk78.nimebox.api.APIService;
import com.xdk78.nimebox.model.AnimeList;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;

import static com.xdk78.nimebox.util.Utils.ANIME_URL;

public class AnimeListFragment extends Fragment {

    private View view;
    private RecyclerView recyclerView;
    private AnimeListAdapter adapter;
    private List<AnimeList> animeList;
    private Unbinder unbinder;

    public AnimeListFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_anime_list, container, false);
        unbinder = ButterKnife.bind(this, view);

        recyclerView = (RecyclerView) view.findViewById(R.id.anime_list);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new AnimeListAdapter(animeList = new ArrayList<>(), getContext());
        recyclerView.setAdapter(adapter);

        loadAnimesAPI();
        return view;
    }

    public void loadAnimesAPI() {
        final OkHttpClient okHttpClient = new OkHttpClient();

        final APIService animeAPI = new RetroJsoup.Builder()
                .url(ANIME_URL)
                .client(okHttpClient)
                .build()
                .create(APIService.class);

        animeAPI.animeList()
                .toList()
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new SingleObserver<List<AnimeList>>() {
                                   @Override
                                   public void onSubscribe(Disposable d) {

                                   }

                                   @Override
                                   public void onSuccess(List<AnimeList> animeList) {
                                       adapter.addItems(animeList);
                                   }

                                   @Override
                                   public void onError(Throwable e) {
                                       Snackbar.make(view, e.toString(), Snackbar.LENGTH_LONG).show();
                                   }
                               }
                );
    }

    @Override
    public void onDestroyView() {
        unbinder.unbind();
        super.onDestroyView();
    }
}
