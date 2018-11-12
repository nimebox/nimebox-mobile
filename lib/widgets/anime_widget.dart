import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:nimebox/store/anime/state.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/anime/actions.dart';
import 'package:nimebox/utils.dart';

class AnimeWidget extends StatelessWidget {
  final String animeTitle;

  const AnimeWidget({Key key, this.animeTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StoreConnector<AppState, AnimeState>(
            converter: (store) => store.state.animeState,
            onInit: (store) {
              store.dispatch(LoadAnime(animeTitle));
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
                  itemCount: state.anime.data.length,
                  itemBuilder: (context, index) {
                    AnimeDataModel item = state.anime.data[index];
                    return Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: InkWell(
                          onTap: () => launchUrl(context, item.url),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(4),
                                child: ListTile(
                                  title: Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.play_circle_outline,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ));
                  });
            }));
  }
}
