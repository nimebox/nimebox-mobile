package com.xdk78.nimebox.di.component

import com.xdk78.nimebox.MainApplication
import com.xdk78.nimebox.di.module.AppModule
import com.xdk78.nimebox.di.module.api.ApiModule
import com.xdk78.nimebox.mvp.base.BaseActivity
import com.xdk78.nimebox.mvp.base.BaseFragment
import com.xdk78.nimebox.ui.MainActivity
import com.xdk78.nimebox.ui.MainFragment
import dagger.Component
import javax.inject.Singleton

/**
 * Created by xdk78 on 2017-11-03.
 */

@Singleton
@Component(modules = [(AppModule::class), (ApiModule::class)]
)
interface MainComponent {
    fun inject(mainFragment: MainFragment)
    fun inject(mainApplication: MainApplication)
    fun inject(mainActivity: MainActivity)
    fun inject(baseActivity: BaseActivity)
    fun inject(baseFragment: BaseFragment)

}