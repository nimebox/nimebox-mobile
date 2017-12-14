package com.xdk78.nimebox.mvp.base

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.xdk78.nimebox.MainApplication

/**
 * Created by xdk78 on 2017-11-04.
 */
open class BaseActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MainApplication.mainComponent.inject(this)
    }
}