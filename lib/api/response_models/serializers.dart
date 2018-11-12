import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:nimebox/api/api.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  NewsResponse,
  NewsDataResponse,
  AnimeListResponse,
  AnimeListDataResponse,
  AnimeResponse,
  AnimeDataResponse,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
