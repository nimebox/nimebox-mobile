package com.xdk78.nimebox;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.github.florent37.retrojsoup.RetroJsoup;
import com.xdk78.nimebox.Adapter.AnimesAdapter;
import com.xdk78.nimebox.Model.Animes;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;

import static com.xdk78.nimebox.Utils.ANIME_URL;

public class AnimesFragment extends Fragment {

    public View view;
    private RecyclerView recyclerView;
    private AnimesAdapter adapter;
    private List<Animes> animes;
    private Unbinder unbinder;

    public AnimesFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_animes, container, false);
        unbinder = ButterKnife.bind(this, view);

        recyclerView = (RecyclerView) view.findViewById(R.id.animes);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new AnimesAdapter(animes = new ArrayList<>(), getContext());
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

        animeAPI.animes()
                .toList()
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())

                //.subscribe(
                //       adapter::addItems,
                //       Throwable::printStackTrace
                //);

                .subscribeWith(new SingleObserver<List<Animes>>() {
                                   @Override
                                   public void onSubscribe(Disposable d) {

                                   }

                                   @Override
                                   public void onSuccess(List<Animes> animes) {
                                       //adapter.addItems(animu.getTitle(),animu.getNewest_episode(), animu.getAnime_image());
                                       adapter.addItems(animes);
                                   }

                                   @Override
                                   public void onError(Throwable e) {
                                       Toast.makeText(getContext(), e.toString(), Toast.LENGTH_LONG).show();
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
