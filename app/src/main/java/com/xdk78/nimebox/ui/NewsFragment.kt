package com.xdk78.nimebox.ui

import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.xdk78.nimebox.R
import com.xdk78.nimebox.adapter.NewsAdapter
import com.xdk78.nimebox.base.BaseFragment
import com.xdk78.nimebox.mvp.model.NewsModel
import com.xdk78.nimebox.mvp.presenter.NewsPresenter
import com.xdk78.nimebox.mvp.view.NewsView
import org.jetbrains.anko.support.v4.find
import java.io.IOException
import javax.inject.Inject

class NewsFragment : BaseFragment(), NewsView {

    lateinit var adapter: NewsAdapter

    @Inject
    lateinit var presenter: NewsPresenter

    lateinit var recyclerView: RecyclerView

    companion object {
        fun newInstance(): NewsFragment {
            return NewsFragment()
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        presenter.subscribe(this)
        presenter.loadData()
    }


    override fun onItemLoaded(items: List<NewsModel>) {
        recyclerView = find(R.id.articles)
        recyclerView.layoutManager = LinearLayoutManager(context)
        adapter = NewsAdapter(context!!, items)
        recyclerView.adapter = adapter
    }

    override fun onError(e: Throwable?) {
        when (e) {
            is IOException -> Log.e("api", e.message)
            else -> Log.e("api", "List is empty")
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        presenter.unsubscribe()
    }

    override fun onDetach() {
        super.onDetach()
        presenter.unsubscribe()
    }
}