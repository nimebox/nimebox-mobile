import 'package:built_value/built_value.dart';
import 'package:nimebox/models/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:nimebox/api/api.dart';

part 'news.g.dart';

abstract class NewsModel implements Built<NewsModel, NewsModelBuilder> {
  String get serviceId;

  BuiltList<NewsDataModel> get data;

  factory NewsModel.mapFromResponse(NewsResponse response) {
    return _$NewsModel._(
      serviceId: response.serviceId == null ? '' : response.serviceId,
      data: response.data == null
          ? BuiltList.from([])
          : BuiltList.from(response.data.map((el) {
              return NewsDataModel.mapFromResponse(el);
            })),
    );
  }

  NewsModel._();
}
