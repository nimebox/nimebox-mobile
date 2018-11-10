import 'package:nimebox/store/store.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild(
      (b) => b..newsState.replace(newsReducer(state.newsState, action)));
}
