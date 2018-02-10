package com.xdk78.nimebox.ui

import android.os.Bundle
import android.support.design.widget.Snackbar
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.xdk78.nimebox.R
import com.xdk78.nimebox.adapter.AnimeListAdapter
import com.xdk78.nimebox.base.BaseFragment
import com.xdk78.nimebox.mvp.model.AnimeListModel
import com.xdk78.nimebox.mvp.presenter.AnimeListPresenter
import com.xdk78.nimebox.mvp.view.AnimeListView
import kotlinx.android.synthetic.main.fragment_anime_list.*
import org.jetbrains.anko.support.v4.find
import java.io.IOException
import javax.inject.Inject

class AnimeListFragment : BaseFragment(), AnimeListView {

    lateinit var adapter: AnimeListAdapter

    @Inject
    lateinit var presenter: AnimeListPresenter

    lateinit var recyclerView: RecyclerView

    companion object {
        fun newInstance(): AnimeListFragment {
            return AnimeListFragment()
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_anime_list, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        swiperefresh.setOnRefreshListener {
            presenter.subscribe(this)
            swiperefresh.isRefreshing = true
            presenter.loadData()
        }
        presenter.subscribe(this)
        presenter.loadData()
    }


    override fun onItemLoaded(items: List<AnimeListModel>) {
        recyclerView = find(R.id.anime_list)
        recyclerView.layoutManager = LinearLayoutManager(context)
        adapter = AnimeListAdapter(context!!, items)
        recyclerView.adapter = adapter

        swiperefresh.isRefreshing = false
    }

    override fun onError(e: Throwable?) {
        when (e) {
            is IOException -> {
                Log.e("api", e.message)
                Snackbar.make(this.view!!, e.toString(), Snackbar.LENGTH_LONG).show()
                swiperefresh.isRefreshing = false
            }
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