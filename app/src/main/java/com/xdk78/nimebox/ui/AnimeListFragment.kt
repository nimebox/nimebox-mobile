package com.xdk78.nimebox.ui

import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.xdk78.nimebox.R
import com.xdk78.nimebox.adapter.AnimeListAdapter
import com.xdk78.nimebox.di.module.api.ApiModule
import com.xdk78.nimebox.di.module.api.ApiRepository
import com.xdk78.nimebox.di.module.api.ApiService
import com.xdk78.nimebox.mvp.base.BaseFragment
import com.xdk78.nimebox.mvp.model.AnimeListModel
import com.xdk78.nimebox.mvp.view.AnimeListView
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.schedulers.Schedulers
import org.jetbrains.anko.support.v4.find
import retrofit2.Retrofit
import java.io.IOException
import javax.inject.Inject

/**
 * Created by xdk78 on 2017-12-02.
 */
class AnimeListFragment : BaseFragment(), AnimeListView {

    lateinit var adapter: AnimeListAdapter

    private val compositeDisposable: CompositeDisposable = CompositeDisposable()

    @Inject
    lateinit var repository: ApiRepository

    @Inject
    lateinit var apiService: ApiService

    @Inject
    lateinit var retrofit: Retrofit

    private val apiModule: ApiModule = ApiModule()

    private lateinit var recyclerView: RecyclerView

//    private fun event(): Disposable {
//        return RxBus.listen(eventType = MessageEvent::class.java).subscribe({
//            println("Message event ${it.action} ${it.message}")
//        })!!
//    }

    companion object {
        fun newInstance(): AnimeListFragment {
            return AnimeListFragment()
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_anime_list, container, false)
    }

    override fun onViewCreated(view: View?, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
//        // Listen for the event
//        event()
        initRetrofit()
        apiService = apiModule.provideApiService(retrofit)
        repository = ApiRepository(apiService)
        loadNews()

    }

    private fun initRetrofit() {
        retrofit = apiModule.provideRetrofit(apiModule.provideRxJavaCallAdapter(), apiModule.provideGsonConverterFactory())
    }

    private fun loadNews() {
        compositeDisposable.add(
                repository
                        .getAnimeList()
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribeOn(Schedulers.io())
                        .subscribe(
                                { items -> onItemLoaded(items) },
                                { error -> onError(error) })
        )

    }

    override fun onItemLoaded(items: MutableList<AnimeListModel>) {
        recyclerView = find(R.id.anime_list)
        recyclerView.layoutManager = LinearLayoutManager(context)
        adapter = AnimeListAdapter(context, items)
        recyclerView.adapter = adapter
    }

    override fun onError(throwable: Throwable?) {
        if (throwable is IOException) {
            Log.e("api animelist", throwable.message)
        } else {
            Log.i("api animelist", "List is empty")
        }
    }

    override fun onDestroyView() {
        compositeDisposable.clear()
//        event().dispose()
        super.onDestroyView()

    }

}