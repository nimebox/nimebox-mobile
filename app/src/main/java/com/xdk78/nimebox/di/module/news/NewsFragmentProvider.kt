package com.xdk78.nimebox.di.module.news

import com.xdk78.nimebox.ui.NewsFragment
import dagger.Module
import dagger.android.ContributesAndroidInjector


@Module
abstract class NewsFragmentProvider {
    @ContributesAndroidInjector(modules = [NewsModule::class])
    abstract fun provideNewsFragment(): NewsFragment

}