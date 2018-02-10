package com.xdk78.nimebox.base

import io.reactivex.Scheduler


interface Schedulers {
    fun mainThread(): Scheduler
    fun backgroundThread(): Scheduler
}