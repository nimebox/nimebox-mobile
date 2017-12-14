package com.xdk78.nimebox

import android.app.Application
import com.xdk78.nimebox.di.component.DaggerMainComponent
import com.xdk78.nimebox.di.component.MainComponent
import com.xdk78.nimebox.di.module.AppModule

/**
 * Created by xdk78 on 2017-06-16.
 */

class MainApplication : Application() {

    companion object {
        lateinit var mainComponent: MainComponent
    }

    override fun onCreate() {
        super.onCreate()
        mainComponent = createMainComponent()
        mainComponent.inject(this)

    }

    private fun createMainComponent() = DaggerMainComponent.builder()
            .appModule(AppModule(this))
            .build()

}
