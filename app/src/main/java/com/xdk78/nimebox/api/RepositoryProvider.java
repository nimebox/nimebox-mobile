package com.xdk78.nimebox.api;


/**
 * Created by xdk78 on 2017-08-17.
 */

public class RepositoryProvider {
    public Repository provideRepository(String url) {
        return new Repository(APIService.Factory.create(url));
    }
}
