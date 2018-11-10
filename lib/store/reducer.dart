import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/news/reducer.dart';
import 'package:nimebox/store/anime_list/reducer.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild(
    (b) => b
      ..newsState.replace(newsReducer(state.newsState, action))
      ..animeListState.replace(animeListReducer(state.animeListState, action)),
  );
}
