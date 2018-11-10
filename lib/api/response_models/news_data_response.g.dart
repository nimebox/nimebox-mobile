// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_response.dart';

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

Serializer<NewsDataResponse> _$newsDataResponseSerializer =
    new _$NewsDataResponseSerializer();

class _$NewsDataResponseSerializer
    implements StructuredSerializer<NewsDataResponse> {
  @override
  final Iterable<Type> types = const [NewsDataResponse, _$NewsDataResponse];
  @override
  final String wireName = 'NewsDataResponse';

  @override
  Iterable serialize(Serializers serializers, NewsDataResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NewsDataResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsDataResponseBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
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

class _$NewsDataResponse extends NewsDataResponse {
  @override
  final String title;
  @override
  final String url;
  @override
  final String description;
  @override
  final String image;

  factory _$NewsDataResponse([void updates(NewsDataResponseBuilder b)]) =>
      (new NewsDataResponseBuilder()..update(updates)).build();

  _$NewsDataResponse._({this.title, this.url, this.description, this.image})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('NewsDataResponse', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('NewsDataResponse', 'url');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('NewsDataResponse', 'description');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('NewsDataResponse', 'image');
    }
  }

  @override
  NewsDataResponse rebuild(void updates(NewsDataResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsDataResponseBuilder toBuilder() =>
      new NewsDataResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsDataResponse &&
        title == other.title &&
        url == other.url &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), url.hashCode), description.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsDataResponse')
          ..add('title', title)
          ..add('url', url)
          ..add('description', description)
          ..add('image', image))
        .toString();
  }
}

class NewsDataResponseBuilder
    implements Builder<NewsDataResponse, NewsDataResponseBuilder> {
  _$NewsDataResponse _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  NewsDataResponseBuilder();

  NewsDataResponseBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _description = _$v.description;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsDataResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsDataResponse;
  }

  @override
  void update(void updates(NewsDataResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsDataResponse build() {
    final _$result = _$v ??
        new _$NewsDataResponse._(
            title: title, url: url, description: description, image: image);
    replace(_$result);
    return _$result;
  }
}
