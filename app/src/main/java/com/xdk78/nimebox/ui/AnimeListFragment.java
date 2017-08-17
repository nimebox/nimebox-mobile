package com.xdk78.nimebox.ui;

import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.xdk78.nimebox.R;
import com.xdk78.nimebox.adapter.AnimeListAdapter;
import com.xdk78.nimebox.api.RepositoryProvider;
import com.xdk78.nimebox.model.AnimeList;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

import static com.xdk78.nimebox.util.Utils.ANIME_URL;

public class AnimeListFragment extends Fragment {

    private View view;
    private RecyclerView recyclerView;
    private AnimeListAdapter adapter;
    private List<AnimeList> animeList;
    private Unbinder unbinder;
    private CompositeDisposable compositeDisposable = new CompositeDisposable();

    public AnimeListFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_anime_list, container, false);
        unbinder = ButterKnife.bind(this, view);

        recyclerView = view.findViewById(R.id.anime_list);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new AnimeListAdapter(animeList = new ArrayList<>(), getContext());
        recyclerView.setAdapter(adapter);

        loadAPI();
        return view;
    }

    public void loadAPI() {
        RepositoryProvider repository = new RepositoryProvider();
        compositeDisposable.add(
                repository.provideRepository(ANIME_URL).getAnimeList()
                        .toList()
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribeOn(Schedulers.io())
                        .subscribe(
                                animeList -> adapter.addItems(animeList),
                                e -> Snackbar.make(view, e.toString(), Snackbar.LENGTH_LONG).show()
                        )
        );
    }


    @Override
    public void onDestroyView() {
        unbinder.unbind();
        compositeDisposable.clear();
        super.onDestroyView();
    }
}
