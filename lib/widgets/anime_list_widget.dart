import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nimebox/screens/anime_details_screen.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/anime_list/actions.dart';
import 'package:nimebox/store/anime_list/state.dart';
import 'package:transparent_image/transparent_image.dart';

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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Wystąpił błąd: ${state.error}'),
                  ),
                );
              }
              return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.animeList.data.length,
                  itemExtent: 128,
                  itemBuilder: (context, index) {
                    AnimeListDataModel item = state.animeList.data[index];
                    return Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AnimeDetailsScreen(item: item),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 128,
                                width: 96,
                                child: CachedNetworkImage(
                                    placeholder:
                                        Image.memory(kTransparentImage),
                                    imageUrl: item.image,
                                    height: 128,
                                    width: 96,
                                    fit: BoxFit.fitWidth),
                              ),
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
                  });
            }));
  }
}
