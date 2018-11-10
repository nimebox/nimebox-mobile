import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'news_data_response.g.dart';

abstract class NewsDataResponse
    implements Built<NewsDataResponse, NewsDataResponseBuilder> {
  factory NewsDataResponse([updates(NewsDataResponseBuilder b)]) =
      _$NewsDataResponse;

  String get title;

  String get url;

  String get description;

  String get image;

  NewsDataResponse._();
  static Serializer<NewsDataResponse> get serializer =>
      _$newsDataResponseSerializer;
}
