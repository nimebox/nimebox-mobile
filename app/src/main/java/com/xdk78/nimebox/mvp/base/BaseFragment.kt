package com.xdk78.nimebox.mvp.base

import android.os.Bundle
import android.support.v4.app.Fragment
import com.xdk78.nimebox.MainApplication

/**
 * Created by xdk78 on 2017-11-04.
 */
open class BaseFragment : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MainApplication.mainComponent.inject(this)
    }
}