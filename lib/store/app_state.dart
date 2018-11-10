import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/store/store.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  NewsState get newsState;

  factory AppState() {
    return _$AppState._(newsState: NewsState());
  }

  AppState._();
  static Serializer<AppState> get serializer => _$appStateSerializer;
}
