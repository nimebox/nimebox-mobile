import 'package:redux/redux.dart';
import 'package:nimebox/store/store.dart';

Reducer<NewsState> newsReducer = combineReducers<NewsState>(
  [
    TypedReducer<NewsState, SetNews>(_setNews),
    TypedReducer<NewsState, SetLoading>(_setLoading),
    TypedReducer<NewsState, SetError>(_setError),
  ],
);

NewsState _setNews(NewsState state, SetNews action) {
  return state.rebuild((b) => b.news.replace(action.news));
}

NewsState _setLoading(NewsState state, SetLoading action) {
  return state.rebuild((b) => b.isLoading = action.isLoading);
}

NewsState _setError(NewsState state, SetError action) {
  return state.rebuild((b) => b.error = action.error);
}
