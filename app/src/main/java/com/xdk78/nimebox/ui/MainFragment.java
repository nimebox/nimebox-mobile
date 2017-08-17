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
import com.xdk78.nimebox.adapter.ArticleAdapter;
import com.xdk78.nimebox.api.RepositoryProvider;
import com.xdk78.nimebox.model.Article;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

import static com.xdk78.nimebox.util.Utils.BASE_URL;

public class MainFragment extends Fragment {

    private View view;
    private RecyclerView recyclerView;
    private ArticleAdapter adapter;
    private List<Article> articles;
    private Unbinder unbinder;
    private CompositeDisposable compositeDisposable = new CompositeDisposable();

    public MainFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_main, container, false);
        unbinder = ButterKnife.bind(this, view);

        recyclerView = view.findViewById(R.id.articles);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new ArticleAdapter(articles = new ArrayList<>(), getContext());
        recyclerView.setAdapter(adapter);
        loadAPI();
        return view;
    }

    public void loadAPI() {
        RepositoryProvider repository = new RepositoryProvider();
        compositeDisposable.add(
                repository.provideRepository(BASE_URL).getArticles()
                        .toList()
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribeOn(Schedulers.io())
                        .subscribe(
                                articles -> adapter.addItems(articles),
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
