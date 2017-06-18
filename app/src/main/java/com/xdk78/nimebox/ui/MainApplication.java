package com.xdk78.nimebox.ui;

import android.app.Application;
import android.content.Context;

/**
 * Created by xdk78 on 2017-06-16.
 */

public class MainApplication extends Application {

    private static Context context;

    public MainApplication() {
    }

    public static Context getContext() {
        return context;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        context = getApplicationContext();
    }
}
