import 'package:nimebox/store/anime_list/actions.dart';
import 'package:nimebox/store/anime_list/state.dart';
import 'package:redux/redux.dart';

Reducer<AnimeListState> animeListReducer = combineReducers<AnimeListState>(
  [
    TypedReducer<AnimeListState, SetAnimeList>(_setAnimeList),
    TypedReducer<AnimeListState, SetLoading>(_setLoading),
    TypedReducer<AnimeListState, SetError>(_setError),
  ],
);

AnimeListState _setAnimeList(AnimeListState state, SetAnimeList action) {
  return state.rebuild((b) => b.animeList.replace(action.animeList));
}

AnimeListState _setLoading(AnimeListState state, SetLoading action) {
  return state.rebuild((b) => b.isLoading = action.isLoading);
}

AnimeListState _setError(AnimeListState state, SetError action) {
  return state.rebuild((b) => b.error = action.error);
}
