import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';
import 'package:nimebox/models/models.dart';

part 'state.g.dart';

abstract class AnimeListState
    implements Built<AnimeListState, AnimeListStateBuilder> {
  @nullable
  AnimeListModel get animeList;

  bool get isLoading;

  @nullable
  String get error;

  factory AnimeListState() {
    return _$AnimeListState._(
      animeList: AnimeListModel.mapFromResponse(AnimeListResponse()),
      isLoading: false,
      error: null,
    );
  }

  AnimeListState._();
  static Serializer<AnimeListState> get serializer =>
      _$animeListStateSerializer;
}
