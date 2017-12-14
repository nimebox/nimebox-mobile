package com.xdk78.nimebox.di.module

import android.app.Application
import android.content.Context
import android.content.res.Resources
import com.xdk78.nimebox.MainApplication
import com.xdk78.nimebox.di.AppQualifier
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

/**
 * Created by xdk78 on 2017-11-04.
 */

@Module
class AppModule(private val app: MainApplication) {

    @Provides
    @Singleton
    fun provideApplication(): Application = app

    @Provides
    @Singleton
    @AppQualifier
    fun provideContext(): Context = app.baseContext

    @Provides
    @Singleton
    fun provideResources(): Resources = app.resources

}