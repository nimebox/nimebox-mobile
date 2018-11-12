// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_data_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<AnimeDataResponse> _$animeDataResponseSerializer =
    new _$AnimeDataResponseSerializer();

class _$AnimeDataResponseSerializer
    implements StructuredSerializer<AnimeDataResponse> {
  @override
  final Iterable<Type> types = const [AnimeDataResponse, _$AnimeDataResponse];
  @override
  final String wireName = 'AnimeDataResponse';

  @override
  Iterable serialize(Serializers serializers, AnimeDataResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AnimeDataResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeDataResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AnimeDataResponse extends AnimeDataResponse {
  @override
  final String title;
  @override
  final String url;

  factory _$AnimeDataResponse([void updates(AnimeDataResponseBuilder b)]) =>
      (new AnimeDataResponseBuilder()..update(updates)).build();

  _$AnimeDataResponse._({this.title, this.url}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('AnimeDataResponse', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('AnimeDataResponse', 'url');
    }
  }

  @override
  AnimeDataResponse rebuild(void updates(AnimeDataResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeDataResponseBuilder toBuilder() =>
      new AnimeDataResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeDataResponse &&
        title == other.title &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeDataResponse')
          ..add('title', title)
          ..add('url', url))
        .toString();
  }
}

class AnimeDataResponseBuilder
    implements Builder<AnimeDataResponse, AnimeDataResponseBuilder> {
  _$AnimeDataResponse _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  AnimeDataResponseBuilder();

  AnimeDataResponseBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeDataResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeDataResponse;
  }

  @override
  void update(void updates(AnimeDataResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeDataResponse build() {
    final _$result = _$v ?? new _$AnimeDataResponse._(title: title, url: url);
    replace(_$result);
    return _$result;
  }
}
