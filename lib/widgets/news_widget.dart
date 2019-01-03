import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/news/actions.dart';
import 'package:nimebox/store/news/state.dart';
import 'package:nimebox/utils.dart';

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    itemCount: state.news.data.length,
                    itemBuilder: (context, index) {
                      NewsDataModel item = state.news.data[index];
                      return Card(
                        elevation: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                                height: 128,
                                width: 96,
                                fit: BoxFit.fitWidth,
                                image: AdvancedNetworkImage(item.image,
                                    useDiskCache: true)),
                            ListTile(
                              title: Text(item.title),
                              subtitle: Text(item.description),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            }));
  }
}
