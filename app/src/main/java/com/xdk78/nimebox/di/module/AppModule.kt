package com.xdk78.nimebox.di.module

import android.content.Context
import com.xdk78.nimebox.MainApp
import dagger.Binds
import dagger.Module


@Module
abstract class AppModule {
    @Binds
    abstract fun provideContext(application: MainApp): Context
}
