import 'package:built_value/built_value.dart';
import 'package:nimebox/api/api.dart';

part 'anime_list_data.g.dart';

abstract class AnimeListDataModel
    implements Built<AnimeListDataModel, AnimeListDataModelBuilder> {
  String get title;

  String get url;

  String get image;

  factory AnimeListDataModel.mapFromResponse(AnimeListDataResponse response) {
    return _$AnimeListDataModel._(
        title: response.title, url: response.url, image: response.image);
  }

  AnimeListDataModel._();
}
