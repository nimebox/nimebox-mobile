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
import com.xdk78.nimebox.Adapter.ArticleAdapter;
import com.xdk78.nimebox.Model.Article;

import java.util.ArrayList;
import java.util.List;

import butterknife.ButterKnife;
import butterknife.Unbinder;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import okhttp3.OkHttpClient;

import static com.xdk78.nimebox.Utils.BASE_URL;

public class MainFragment extends Fragment {

    public View view;
    private RecyclerView recyclerView;
    private ArticleAdapter adapter;
    private List<Article> articles;
    private Unbinder unbinder;

    public MainFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_main, container, false);
        unbinder = ButterKnife.bind(this, view);

        recyclerView = (RecyclerView) view.findViewById(R.id.articles);

        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        adapter = new ArticleAdapter(articles = new ArrayList<>(), getContext());
        recyclerView.setAdapter(adapter);

        loadArticleAPI();
        return view;
    }

    public void loadArticleAPI() {
        final OkHttpClient okHttpClient = new OkHttpClient();

        final APIService articleService = new RetroJsoup.Builder()
                .url(BASE_URL)
                .client(okHttpClient)
                .build()
                .create(APIService.class);

        articleService.articles()
                .toList()
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribeWith(new SingleObserver<List<Article>>() {
                                   @Override
                                   public void onSubscribe(Disposable d) {

                                   }

                                   @Override
                                   public void onSuccess(List<Article> articles) {
                                       adapter.addItems(articles);
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
