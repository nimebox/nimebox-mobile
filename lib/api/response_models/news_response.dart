import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'news_response.g.dart';

abstract class NewsResponse
    implements Built<NewsResponse, NewsResponseBuilder> {
  factory NewsResponse([updates(NewsResponseBuilder b)]) = _$NewsResponse;
  @nullable
  String get serviceId;

  BuiltList<NewsDataResponse> get data;

  NewsResponse._();
  static Serializer<NewsResponse> get serializer => _$newsResponseSerializer;
}
