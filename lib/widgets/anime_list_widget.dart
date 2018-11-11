import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/anime_list/actions.dart';
import 'package:nimebox/store/anime_list/state.dart';

class AnimeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppState, AnimeListState>(
            converter: (store) => store.state.animeListState,
            onInit: (store) {
              store.dispatch(LoadAnimeList());
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
              return StoreConnector<AppState, VoidCallback>(converter: (store) {
                return () => store.dispatch(LoadAnimeList());
              }, builder: (context, callback) {
                return Container(
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.animeList.data.length,
                        itemExtent: 128,
                        itemBuilder: (context, index) {
                          AnimeListDataModel item = state.animeList.data[index];
                          return Card(
                              elevation: 2,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CachedNetworkImage(
                                        placeholder:
                                            CircularProgressIndicator(),
                                        imageUrl: item.image,
                                        height: 128,
                                        width: 96,
                                        fit: BoxFit.fitWidth),
                                    Expanded(
                                      child: Text(
                                        item.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }));
              });
            }));
  }
}
