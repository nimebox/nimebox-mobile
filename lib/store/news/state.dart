import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';
import 'package:nimebox/models/models.dart';

part 'state.g.dart';

abstract class NewsState implements Built<NewsState, NewsStateBuilder> {
  @nullable
  NewsModel get news;

  bool get isLoading;

  @nullable
  String get error;

  factory NewsState() {
    return _$NewsState._(
      news: NewsModel.mapFromResponse(NewsResponse()),
      isLoading: false,
      error: null,
    );
  }

  NewsState._();
  static Serializer<NewsState> get serializer => _$newsStateSerializer;
}
