import 'package:built_value/built_value.dart';
import 'package:nimebox/api/api.dart';

part 'anime_data.g.dart';

abstract class AnimeDataModel
    implements Built<AnimeDataModel, AnimeDataModelBuilder> {
  String get title;

  String get url;

  factory AnimeDataModel.mapFromResponse(AnimeDataResponse response) {
    return _$AnimeDataModel._(title: response.title, url: response.url);
  }

  AnimeDataModel._();
}
