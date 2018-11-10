import 'package:built_value/built_value.dart';
import 'package:nimebox/api/api.dart';

part 'news_data.g.dart';

abstract class NewsDataModel
    implements Built<NewsDataModel, NewsDataModelBuilder> {
  String get title;

  String get url;

  String get description;

  factory NewsDataModel.mapFromResponse(NewsDataResponse response) {
    return _$NewsDataModel._(
        title: response.title,
        url: response.url,
        description: response.description);
  }

  NewsDataModel._();
}
