package com.xdk78.nimebox.di

import com.xdk78.nimebox.di.module.news.NewsFragmentProvider
import com.xdk78.nimebox.di.module.news.NewsModule
import com.xdk78.nimebox.ui.MainActivity
import dagger.Module
import dagger.android.ContributesAndroidInjector


@Module
abstract class ActivityBuilder {

    @ContributesAndroidInjector(modules = [NewsModule::class, NewsFragmentProvider::class])
    abstract fun bindMainActivity(): MainActivity

}
