import 'package:built_value/built_value.dart';
import 'package:nimebox/models/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:nimebox/api/api.dart';

part 'anime.g.dart';

abstract class AnimeModel implements Built<AnimeModel, AnimeModelBuilder> {
  String get serviceId;

  BuiltList<AnimeDataModel> get data;

  factory AnimeModel.mapFromResponse(AnimeResponse response) {
    return _$AnimeModel._(
      serviceId: response.serviceId == null ? '' : response.serviceId,
      data: response.data == null
          ? BuiltList.from([])
          : BuiltList.from(response.data.map((el) {
              return AnimeDataModel.mapFromResponse(el);
            })),
    );
  }

  AnimeModel._();
}
