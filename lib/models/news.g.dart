// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

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

class _$NewsModel extends NewsModel {
  @override
  final String serviceId;
  @override
  final BuiltList<NewsDataModel> data;

  factory _$NewsModel([void updates(NewsModelBuilder b)]) =>
      (new NewsModelBuilder()..update(updates)).build();

  _$NewsModel._({this.serviceId, this.data}) : super._() {
    if (serviceId == null) {
      throw new BuiltValueNullFieldError('NewsModel', 'serviceId');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('NewsModel', 'data');
    }
  }

  @override
  NewsModel rebuild(void updates(NewsModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsModelBuilder toBuilder() => new NewsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsModel &&
        serviceId == other.serviceId &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, serviceId.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsModel')
          ..add('serviceId', serviceId)
          ..add('data', data))
        .toString();
  }
}

class NewsModelBuilder implements Builder<NewsModel, NewsModelBuilder> {
  _$NewsModel _$v;

  String _serviceId;
  String get serviceId => _$this._serviceId;
  set serviceId(String serviceId) => _$this._serviceId = serviceId;

  ListBuilder<NewsDataModel> _data;
  ListBuilder<NewsDataModel> get data =>
      _$this._data ??= new ListBuilder<NewsDataModel>();
  set data(ListBuilder<NewsDataModel> data) => _$this._data = data;

  NewsModelBuilder();

  NewsModelBuilder get _$this {
    if (_$v != null) {
      _serviceId = _$v.serviceId;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsModel;
  }

  @override
  void update(void updates(NewsModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsModel build() {
    _$NewsModel _$result;
    try {
      _$result =
          _$v ?? new _$NewsModel._(serviceId: serviceId, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
