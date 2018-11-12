import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/store/anime/state.dart';
import 'package:nimebox/store/anime_list/state.dart';
import 'package:nimebox/store/news/state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  NewsState get newsState;
  AnimeListState get animeListState;
  AnimeState get animeState;

  factory AppState() {
    return _$AppState._(
        newsState: NewsState(),
        animeListState: AnimeListState(),
        animeState: AnimeState());
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;
}
