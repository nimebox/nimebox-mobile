import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';
import 'package:nimebox/models/models.dart';

part 'state.g.dart';

abstract class AnimeState implements Built<AnimeState, AnimeStateBuilder> {
  @nullable
  AnimeModel get anime;

  bool get isLoading;

  @nullable
  String get error;

  factory AnimeState() {
    return _$AnimeState._(
      anime: AnimeModel.mapFromResponse(AnimeResponse()),
      isLoading: false,
      error: null,
    );
  }

  AnimeState._();
  static Serializer<AnimeState> get serializer => _$animeStateSerializer;
}
