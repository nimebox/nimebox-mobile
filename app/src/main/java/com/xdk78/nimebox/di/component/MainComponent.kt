package com.xdk78.nimebox.di.component

import com.xdk78.nimebox.MainApp
import com.xdk78.nimebox.di.module.ActivityBuilder
import com.xdk78.nimebox.di.module.AppModule
import com.xdk78.nimebox.di.module.api.ApiModule
import dagger.Component
import dagger.android.AndroidInjector
import dagger.android.support.AndroidSupportInjectionModule
import javax.inject.Singleton


@Singleton
@Component(modules = [
    AndroidSupportInjectionModule::class,
    AppModule::class,
    ActivityBuilder::class,
    ApiModule::class])

internal interface MainComponent : AndroidInjector<MainApp> {
    @Component.Builder
    abstract class Builder : AndroidInjector.Builder<MainApp>()
}