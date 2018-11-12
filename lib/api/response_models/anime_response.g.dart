// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

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

Serializer<AnimeResponse> _$animeResponseSerializer =
    new _$AnimeResponseSerializer();

class _$AnimeResponseSerializer implements StructuredSerializer<AnimeResponse> {
  @override
  final Iterable<Type> types = const [AnimeResponse, _$AnimeResponse];
  @override
  final String wireName = 'AnimeResponse';

  @override
  Iterable serialize(Serializers serializers, AnimeResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AnimeDataResponse)])),
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
  AnimeResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeResponseBuilder();

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
                      BuiltList, const [const FullType(AnimeDataResponse)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$AnimeResponse extends AnimeResponse {
  @override
  final String serviceId;
  @override
  final BuiltList<AnimeDataResponse> data;

  factory _$AnimeResponse([void updates(AnimeResponseBuilder b)]) =>
      (new AnimeResponseBuilder()..update(updates)).build();

  _$AnimeResponse._({this.serviceId, this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('AnimeResponse', 'data');
    }
  }

  @override
  AnimeResponse rebuild(void updates(AnimeResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeResponseBuilder toBuilder() => new AnimeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeResponse &&
        serviceId == other.serviceId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeResponse')
          ..add('serviceId', serviceId)
          ..add('data', data))
        .toString();
  }
}

class AnimeResponseBuilder
    implements Builder<AnimeResponse, AnimeResponseBuilder> {
  _$AnimeResponse _$v;

  String _serviceId;
  String get serviceId => _$this._serviceId;
  set serviceId(String serviceId) => _$this._serviceId = serviceId;

  ListBuilder<AnimeDataResponse> _data;
  ListBuilder<AnimeDataResponse> get data =>
      _$this._data ??= new ListBuilder<AnimeDataResponse>();
  set data(ListBuilder<AnimeDataResponse> data) => _$this._data = data;

  AnimeResponseBuilder();

  AnimeResponseBuilder get _$this {
    if (_$v != null) {
      _serviceId = _$v.serviceId;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeResponse;
  }

  @override
  void update(void updates(AnimeResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeResponse build() {
    _$AnimeResponse _$result;
    try {
      _$result = _$v ??
          new _$AnimeResponse._(serviceId: serviceId, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AnimeResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
