import 'package:built_value/built_value.dart';
import 'package:nimebox/models/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:nimebox/api/api.dart';

part 'anime_list.g.dart';

abstract class AnimeListModel
    implements Built<AnimeListModel, AnimeListModelBuilder> {
  String get serviceId;

  BuiltList<AnimeListDataModel> get data;

  factory AnimeListModel.mapFromResponse(AnimeListResponse response) {
    return _$AnimeListModel._(
      serviceId: response.serviceId == null ? '' : response.serviceId,
      data: response.data == null
          ? BuiltList.from([])
          : BuiltList.from(response.data.map((el) {
              return AnimeListDataModel.mapFromResponse(el);
            })),
    );
  }

  AnimeListModel._();
}
