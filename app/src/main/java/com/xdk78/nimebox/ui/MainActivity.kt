package com.xdk78.nimebox.ui

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import co.zsmb.materialdrawerkt.builders.accountHeader
import co.zsmb.materialdrawerkt.builders.drawer
import co.zsmb.materialdrawerkt.draweritems.badgeable.primaryItem
import com.mikepenz.materialdrawer.AccountHeader
import com.mikepenz.materialdrawer.Drawer
import com.xdk78.nimebox.R
import com.xdk78.nimebox.base.BaseActivity
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : BaseActivity() {

    private lateinit var result: Drawer
    private lateinit var headerResult: AccountHeader

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        supportFragmentManager.beginTransaction().replace(R.id.fragment_container, NewsFragment.newInstance()).commit()

        result = drawer {
            hasStableIds = true
            toolbar = this@MainActivity.toolbar
            savedInstance = savedInstanceState
            headerResult = accountHeader {
                background = R.drawable.side_nav_bar
                savedInstance = savedInstanceState
                translucentStatusBar = true
            }

            primaryItem("News") {
                identifier = 0
                onClick { _ ->
                    val fragment = NewsFragment.newInstance()
                    supportFragmentManager.beginTransaction().replace(R.id.fragment_container, fragment).commit()
                    true
                }
            }

            primaryItem("Anime") {
                identifier = 1
                onClick { _ ->
                    val fragment = AnimeListFragment.newInstance()
                    supportFragmentManager.beginTransaction().replace(R.id.fragment_container, fragment).commit()
                    true
                }
            }
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_settings -> true
            else -> super.onOptionsItemSelected(item)
        }
    }

    override fun onSaveInstanceState(outState: Bundle?) {
        result.saveInstanceState(outState)
        headerResult.saveInstanceState(outState)
        super.onSaveInstanceState(outState)
    }

    override fun onBackPressed() {
        when {
            result.isDrawerOpen -> result.closeDrawer()
            else -> super.onBackPressed()
        }
    }

}