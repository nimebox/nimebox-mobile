import 'package:nimebox/api/client.dart';
import 'package:redux/redux.dart';
import 'package:nimebox/store/store.dart';
import 'package:nimebox/models/models.dart';

final api = ApiClient();

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadNews) {
    store.dispatch(SetLoading(isLoading: true));
    api.fetchNews().then((el) {
      store.dispatch(SetLoading(isLoading: false));
      store.dispatch(SetNews(news: NewsModel.mapFromResponse(el)));
    }).catchError((error) {
      store.dispatch(SetLoading(isLoading: false));
      store.dispatch(SetError(error: error.toString()));
    });
  }

  next(action);
}
