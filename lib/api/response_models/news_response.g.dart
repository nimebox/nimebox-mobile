// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

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

Serializer<NewsResponse> _$newsResponseSerializer =
    new _$NewsResponseSerializer();

class _$NewsResponseSerializer implements StructuredSerializer<NewsResponse> {
  @override
  final Iterable<Type> types = const [NewsResponse, _$NewsResponse];
  @override
  final String wireName = 'NewsResponse';

  @override
  Iterable serialize(Serializers serializers, NewsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(NewsDataResponse)])),
    ];
    if (object.serviceId != null) {
      result
        ..add('serviceId')
        ..add(serializers.serialize(object.serviceId,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  NewsResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'serviceId':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(NewsDataResponse)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$NewsResponse extends NewsResponse {
  @override
  final String serviceId;
  @override
  final BuiltList<NewsDataResponse> data;

  factory _$NewsResponse([void updates(NewsResponseBuilder b)]) =>
      (new NewsResponseBuilder()..update(updates)).build();

  _$NewsResponse._({this.serviceId, this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('NewsResponse', 'data');
    }
  }

  @override
  NewsResponse rebuild(void updates(NewsResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsResponseBuilder toBuilder() => new NewsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsResponse &&
        serviceId == other.serviceId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsResponse')
          ..add('serviceId', serviceId)
          ..add('data', data))
        .toString();
  }
}

class NewsResponseBuilder
    implements Builder<NewsResponse, NewsResponseBuilder> {
  _$NewsResponse _$v;

  String _serviceId;
  String get serviceId => _$this._serviceId;
  set serviceId(String serviceId) => _$this._serviceId = serviceId;

  ListBuilder<NewsDataResponse> _data;
  ListBuilder<NewsDataResponse> get data =>
      _$this._data ??= new ListBuilder<NewsDataResponse>();
  set data(ListBuilder<NewsDataResponse> data) => _$this._data = data;

  NewsResponseBuilder();

  NewsResponseBuilder get _$this {
    if (_$v != null) {
      _serviceId = _$v.serviceId;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsResponse;
  }

  @override
  void update(void updates(NewsResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsResponse build() {
    _$NewsResponse _$result;
    try {
      _$result =
          _$v ?? new _$NewsResponse._(serviceId: serviceId, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
