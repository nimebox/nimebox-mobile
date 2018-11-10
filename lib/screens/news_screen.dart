import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:nimebox/store/store.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsy'),
      ),
      body: Container(
          child: StoreConnector<AppState, NewsState>(
              converter: (store) => store.state.newsState,
              onInit: (store) {
                store.dispatch(LoadNews());
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!state.isLoading && state.error != null) {
                  return Center(
                    child: Text('Wystąpił błąd: ${state.error}'),
                  );
                }
                return StoreConnector<AppState, VoidCallback>(
                    converter: (store) {
                  return () => store.dispatch(LoadNews());
                }, builder: (context, callback) {
                  return Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.news.data.length,
                          itemBuilder: (context, index) {
                            NewsDataModel item = state.news.data[index];
                            return Card(
                              elevation: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CachedNetworkImage(
                                      placeholder: CircularProgressIndicator(),
                                      imageUrl: item.url),
                                  ListTile(
                                    title: Text(item.title),
                                    subtitle: Text(item.description),
                                  ),
                                ],
                              ),
                            );
                          }));
                });
              })),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.rss_feed),
              tooltip: 'Newsy',
              color: Colors.indigo,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            IconButton(
              icon: Icon(Icons.video_library),
              tooltip: 'Anime',
              color: Colors.indigo,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.library_books),
              tooltip: 'Manga',
              color: Colors.indigo,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Ustawienia',
              color: Colors.indigo,
              onPressed: () {},
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
