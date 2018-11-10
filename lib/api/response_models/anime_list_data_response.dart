import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'anime_list_data_response.g.dart';

abstract class AnimeListDataResponse
    implements Built<AnimeListDataResponse, AnimeListDataResponseBuilder> {
  factory AnimeListDataResponse([updates(AnimeListDataResponseBuilder b)]) =
      _$AnimeListDataResponse;

  String get title;

  String get url;

  String get image;

  AnimeListDataResponse._();
  static Serializer<AnimeListDataResponse> get serializer =>
      _$animeListDataResponseSerializer;
}
