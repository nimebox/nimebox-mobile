import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/news/reducer.dart';
import 'package:nimebox/store/anime_list/reducer.dart';
import 'package:nimebox/store/anime/reducer.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild(
    (b) => b
      ..newsState.replace(newsReducer(state.newsState, action))
      ..animeListState.replace(animeListReducer(state.animeListState, action))
      ..animeState.replace(animeReducer(state.animeState, action)),
  );
}
