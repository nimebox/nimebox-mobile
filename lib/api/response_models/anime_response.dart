import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'anime_response.g.dart';

abstract class AnimeResponse
    implements Built<AnimeResponse, AnimeResponseBuilder> {
  factory AnimeResponse([updates(AnimeResponseBuilder b)]) = _$AnimeResponse;
  @nullable
  String get serviceId;

  BuiltList<AnimeDataResponse> get data;

  AnimeResponse._();
  static Serializer<AnimeResponse> get serializer => _$animeResponseSerializer;
}
