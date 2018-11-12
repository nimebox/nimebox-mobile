// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

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

class _$AnimeModel extends AnimeModel {
  @override
  final String serviceId;
  @override
  final BuiltList<AnimeDataModel> data;

  factory _$AnimeModel([void updates(AnimeModelBuilder b)]) =>
      (new AnimeModelBuilder()..update(updates)).build();

  _$AnimeModel._({this.serviceId, this.data}) : super._() {
    if (serviceId == null) {
      throw new BuiltValueNullFieldError('AnimeModel', 'serviceId');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('AnimeModel', 'data');
    }
  }

  @override
  AnimeModel rebuild(void updates(AnimeModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeModelBuilder toBuilder() => new AnimeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeModel &&
        serviceId == other.serviceId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeModel')
          ..add('serviceId', serviceId)
          ..add('data', data))
        .toString();
  }
}

class AnimeModelBuilder implements Builder<AnimeModel, AnimeModelBuilder> {
  _$AnimeModel _$v;

  String _serviceId;
  String get serviceId => _$this._serviceId;
  set serviceId(String serviceId) => _$this._serviceId = serviceId;

  ListBuilder<AnimeDataModel> _data;
  ListBuilder<AnimeDataModel> get data =>
      _$this._data ??= new ListBuilder<AnimeDataModel>();
  set data(ListBuilder<AnimeDataModel> data) => _$this._data = data;

  AnimeModelBuilder();

  AnimeModelBuilder get _$this {
    if (_$v != null) {
      _serviceId = _$v.serviceId;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeModel;
  }

  @override
  void update(void updates(AnimeModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeModel build() {
    _$AnimeModel _$result;
    try {
      _$result =
          _$v ?? new _$AnimeModel._(serviceId: serviceId, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AnimeModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
