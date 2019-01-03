import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:nimebox/screens/anime_details_screen.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/anime_list/actions.dart';
import 'package:nimebox/store/anime_list/state.dart';
import 'package:nimebox/utils.dart';

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
              return ScrollConfiguration(
                behavior: NotSuddenJumpScrollBehavior(),
                child: ListView.builder(
                    physics: NotSuddenJumpPhysics(),
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
                                Image(
                                    height: 128,
                                    width: 96,
                                    fit: BoxFit.fitWidth,
                                    image: AdvancedNetworkImage(item.image,
                                        useDiskCache: true)),
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
                    }),
              );
            }));
  }
}
