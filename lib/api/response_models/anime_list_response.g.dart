// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list_response.dart';

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

Serializer<AnimeListResponse> _$animeListResponseSerializer =
    new _$AnimeListResponseSerializer();

class _$AnimeListResponseSerializer
    implements StructuredSerializer<AnimeListResponse> {
  @override
  final Iterable<Type> types = const [AnimeListResponse, _$AnimeListResponse];
  @override
  final String wireName = 'AnimeListResponse';

  @override
  Iterable serialize(Serializers serializers, AnimeListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AnimeListDataResponse)])),
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
  AnimeListResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeListResponseBuilder();

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
                      BuiltList, const [const FullType(AnimeListDataResponse)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$AnimeListResponse extends AnimeListResponse {
  @override
  final String serviceId;
  @override
  final BuiltList<AnimeListDataResponse> data;

  factory _$AnimeListResponse([void updates(AnimeListResponseBuilder b)]) =>
      (new AnimeListResponseBuilder()..update(updates)).build();

  _$AnimeListResponse._({this.serviceId, this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('AnimeListResponse', 'data');
    }
  }

  @override
  AnimeListResponse rebuild(void updates(AnimeListResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeListResponseBuilder toBuilder() =>
      new AnimeListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeListResponse &&
        serviceId == other.serviceId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeListResponse')
          ..add('serviceId', serviceId)
          ..add('data', data))
        .toString();
  }
}

class AnimeListResponseBuilder
    implements Builder<AnimeListResponse, AnimeListResponseBuilder> {
  _$AnimeListResponse _$v;

  String _serviceId;
  String get serviceId => _$this._serviceId;
  set serviceId(String serviceId) => _$this._serviceId = serviceId;

  ListBuilder<AnimeListDataResponse> _data;
  ListBuilder<AnimeListDataResponse> get data =>
      _$this._data ??= new ListBuilder<AnimeListDataResponse>();
  set data(ListBuilder<AnimeListDataResponse> data) => _$this._data = data;

  AnimeListResponseBuilder();

  AnimeListResponseBuilder get _$this {
    if (_$v != null) {
      _serviceId = _$v.serviceId;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeListResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeListResponse;
  }

  @override
  void update(void updates(AnimeListResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeListResponse build() {
    _$AnimeListResponse _$result;
    try {
      _$result = _$v ??
          new _$AnimeListResponse._(serviceId: serviceId, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AnimeListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
