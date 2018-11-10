// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list.dart';

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

class _$AnimeListModel extends AnimeListModel {
  @override
  final String serviceId;
  @override
  final BuiltList<AnimeListDataModel> data;

  factory _$AnimeListModel([void updates(AnimeListModelBuilder b)]) =>
      (new AnimeListModelBuilder()..update(updates)).build();

  _$AnimeListModel._({this.serviceId, this.data}) : super._() {
    if (serviceId == null) {
      throw new BuiltValueNullFieldError('AnimeListModel', 'serviceId');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('AnimeListModel', 'data');
    }
  }

  @override
  AnimeListModel rebuild(void updates(AnimeListModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeListModelBuilder toBuilder() =>
      new AnimeListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeListModel &&
        serviceId == other.serviceId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeListModel')
          ..add('serviceId', serviceId)
          ..add('data', data))
        .toString();
  }
}

class AnimeListModelBuilder
    implements Builder<AnimeListModel, AnimeListModelBuilder> {
  _$AnimeListModel _$v;

  String _serviceId;
  String get serviceId => _$this._serviceId;
  set serviceId(String serviceId) => _$this._serviceId = serviceId;

  ListBuilder<AnimeListDataModel> _data;
  ListBuilder<AnimeListDataModel> get data =>
      _$this._data ??= new ListBuilder<AnimeListDataModel>();
  set data(ListBuilder<AnimeListDataModel> data) => _$this._data = data;

  AnimeListModelBuilder();

  AnimeListModelBuilder get _$this {
    if (_$v != null) {
      _serviceId = _$v.serviceId;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeListModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeListModel;
  }

  @override
  void update(void updates(AnimeListModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeListModel build() {
    _$AnimeListModel _$result;
    try {
      _$result = _$v ??
          new _$AnimeListModel._(serviceId: serviceId, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AnimeListModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
