package com.xdk78.nimebox.di.module.anime

import com.xdk78.nimebox.ui.AnimeListFragment
import dagger.Module
import dagger.android.ContributesAndroidInjector


@Module
abstract class AnimeListFragmentProvider {
    @ContributesAndroidInjector(modules = [AnimeListModule::class])
    abstract fun provideAnimeListFragment(): AnimeListFragment

}