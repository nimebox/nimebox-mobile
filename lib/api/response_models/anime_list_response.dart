import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'anime_list_response.g.dart';

abstract class AnimeListResponse
    implements Built<AnimeListResponse, AnimeListResponseBuilder> {
  factory AnimeListResponse([updates(AnimeListResponseBuilder b)]) =
      _$AnimeListResponse;
  @nullable
  String get serviceId;

  BuiltList<AnimeListDataResponse> get data;

  AnimeListResponse._();
  static Serializer<AnimeListResponse> get serializer =>
      _$animeListResponseSerializer;
}
