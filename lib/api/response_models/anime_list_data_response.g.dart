// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list_data_response.dart';

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

Serializer<AnimeListDataResponse> _$animeListDataResponseSerializer =
    new _$AnimeListDataResponseSerializer();

class _$AnimeListDataResponseSerializer
    implements StructuredSerializer<AnimeListDataResponse> {
  @override
  final Iterable<Type> types = const [
    AnimeListDataResponse,
    _$AnimeListDataResponse
  ];
  @override
  final String wireName = 'AnimeListDataResponse';

  @override
  Iterable serialize(Serializers serializers, AnimeListDataResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AnimeListDataResponse deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeListDataResponseBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AnimeListDataResponse extends AnimeListDataResponse {
  @override
  final String title;
  @override
  final String url;
  @override
  final String image;

  factory _$AnimeListDataResponse(
          [void updates(AnimeListDataResponseBuilder b)]) =>
      (new AnimeListDataResponseBuilder()..update(updates)).build();

  _$AnimeListDataResponse._({this.title, this.url, this.image}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('AnimeListDataResponse', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('AnimeListDataResponse', 'url');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('AnimeListDataResponse', 'image');
    }
  }

  @override
  AnimeListDataResponse rebuild(void updates(AnimeListDataResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeListDataResponseBuilder toBuilder() =>
      new AnimeListDataResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeListDataResponse &&
        title == other.title &&
        url == other.url &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), url.hashCode), image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeListDataResponse')
          ..add('title', title)
          ..add('url', url)
          ..add('image', image))
        .toString();
  }
}

class AnimeListDataResponseBuilder
    implements Builder<AnimeListDataResponse, AnimeListDataResponseBuilder> {
  _$AnimeListDataResponse _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  AnimeListDataResponseBuilder();

  AnimeListDataResponseBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeListDataResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeListDataResponse;
  }

  @override
  void update(void updates(AnimeListDataResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeListDataResponse build() {
    final _$result = _$v ??
        new _$AnimeListDataResponse._(title: title, url: url, image: image);
    replace(_$result);
    return _$result;
  }
}
