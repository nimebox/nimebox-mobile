import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nimebox/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/news/actions.dart';
import 'package:nimebox/store/news/state.dart';
import 'package:transparent_image/transparent_image.dart';

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
              return ListView.builder(
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
                              placeholder: Image.memory(kTransparentImage),
                              imageUrl: item.image),
                          ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.description),
                          ),
                        ],
                      ),
                    );
                  });
            }));
  }
}
