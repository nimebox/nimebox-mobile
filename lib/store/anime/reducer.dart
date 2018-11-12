import 'package:nimebox/store/anime/actions.dart';
import 'package:nimebox/store/anime/state.dart';
import 'package:redux/redux.dart';

Reducer<AnimeState> animeReducer = combineReducers<AnimeState>(
  [
    TypedReducer<AnimeState, SetAnime>(_setAnime),
    TypedReducer<AnimeState, SetLoading>(_setLoading),
    TypedReducer<AnimeState, SetError>(_setError),
  ],
);

AnimeState _setAnime(AnimeState state, SetAnime action) {
  return state.rebuild((b) => b.anime.replace(action.anime));
}

AnimeState _setLoading(AnimeState state, SetLoading action) {
  return state.rebuild((b) => b.isLoading = action.isLoading);
}

AnimeState _setError(AnimeState state, SetError action) {
  return state.rebuild((b) => b.error = action.error);
}
