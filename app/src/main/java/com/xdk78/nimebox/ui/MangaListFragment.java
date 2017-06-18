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
import com.xdk78.nimebox.adapter.MangaListAdapter;
import com.xdk78.nimebox.api.APIService;
import com.xdk78.nimebox.model.MangaList;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;

import static com.xdk78.nimebox.util.Utils.MANGA_URL;

public class MangaListFragment extends Fragment {

    private View view;
    private RecyclerView recyclerView;
    private MangaListAdapter adapter;
    private List<MangaList> mangaList;
    private Unbinder unbinder;

    public MangaListFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_manga_list, container, false);
        unbinder = ButterKnife.bind(this, view);

        recyclerView = (RecyclerView) view.findViewById(R.id.manga_list);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new MangaListAdapter(mangaList = new ArrayList<>(), getContext());
        recyclerView.setAdapter(adapter);

        loadMangaListAPI();
        return view;
    }

    public void loadMangaListAPI() {
        final OkHttpClient okHttpClient = new OkHttpClient();

        final APIService mangaListAPI = new RetroJsoup.Builder()
                .url(MANGA_URL)
                .client(okHttpClient)
                .build()
                .create(APIService.class);

        mangaListAPI.mangaList()
                .toList()
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new SingleObserver<List<MangaList>>() {
                                   @Override
                                   public void onSubscribe(Disposable d) {

                                   }

                                   @Override
                                   public void onSuccess(List<MangaList> mangaList) {
                                       adapter.addItems(mangaList);
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
