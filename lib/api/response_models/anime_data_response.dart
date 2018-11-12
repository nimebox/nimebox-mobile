import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'anime_data_response.g.dart';

abstract class AnimeDataResponse
    implements Built<AnimeDataResponse, AnimeDataResponseBuilder> {
  factory AnimeDataResponse([updates(AnimeDataResponseBuilder b)]) =
      _$AnimeDataResponse;

  String get title;

  String get url;

  AnimeDataResponse._();
  static Serializer<AnimeDataResponse> get serializer =>
      _$animeDataResponseSerializer;
}
