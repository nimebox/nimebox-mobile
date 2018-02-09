package com.xdk78.nimebox


import com.xdk78.nimebox.di.component.DaggerMainComponent
import dagger.android.AndroidInjector
import dagger.android.support.DaggerApplication


class MainApp : DaggerApplication() {

    override fun applicationInjector(): AndroidInjector<out DaggerApplication> =
            DaggerMainComponent.builder().create(this)

}
