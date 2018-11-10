import 'package:nimebox/api/client.dart';
import 'package:nimebox/models/models.dart';
import 'package:nimebox/models/news.dart';
import 'package:nimebox/store/anime_list/actions.dart' as animeListAction;
import 'package:nimebox/store/app_state.dart';
import 'package:nimebox/store/news/actions.dart' as newsAction;
import 'package:redux/redux.dart';

final api = ApiClient();

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is newsAction.LoadNews) {
    store.dispatch(newsAction.SetLoading(isLoading: true));
    api.fetchNews().then((el) {
      store.dispatch(newsAction.SetLoading(isLoading: false));
      store.dispatch(newsAction.SetNews(news: NewsModel.mapFromResponse(el)));
    }).catchError((error) {
      store.dispatch(newsAction.SetLoading(isLoading: false));
      store.dispatch(newsAction.SetError(error: error.toString()));
    });
  } else if (action is animeListAction.LoadAnimeList) {
    store.dispatch(animeListAction.SetLoading(isLoading: true));
    api.fetchAnimeList().then((el) {
      store.dispatch(animeListAction.SetLoading(isLoading: false));
      store.dispatch(animeListAction.SetAnimeList(
          animeList: AnimeListModel.mapFromResponse(el)));
    }).catchError((error) {
      store.dispatch(animeListAction.SetLoading(isLoading: false));
      store.dispatch(animeListAction.SetError(error: error.toString()));
    });
  }

  next(action);
}
