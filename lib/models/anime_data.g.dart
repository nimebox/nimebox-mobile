// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_data.dart';

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

class _$AnimeDataModel extends AnimeDataModel {
  @override
  final String title;
  @override
  final String url;

  factory _$AnimeDataModel([void updates(AnimeDataModelBuilder b)]) =>
      (new AnimeDataModelBuilder()..update(updates)).build();

  _$AnimeDataModel._({this.title, this.url}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('AnimeDataModel', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('AnimeDataModel', 'url');
    }
  }

  @override
  AnimeDataModel rebuild(void updates(AnimeDataModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeDataModelBuilder toBuilder() =>
      new AnimeDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeDataModel && title == other.title && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeDataModel')
          ..add('title', title)
          ..add('url', url))
        .toString();
  }
}

class AnimeDataModelBuilder
    implements Builder<AnimeDataModel, AnimeDataModelBuilder> {
  _$AnimeDataModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  AnimeDataModelBuilder();

  AnimeDataModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeDataModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeDataModel;
  }

  @override
  void update(void updates(AnimeDataModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeDataModel build() {
    final _$result = _$v ?? new _$AnimeDataModel._(title: title, url: url);
    replace(_$result);
    return _$result;
  }
}
