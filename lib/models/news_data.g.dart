// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data.dart';

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

class _$NewsDataModel extends NewsDataModel {
  @override
  final String title;
  @override
  final String url;
  @override
  final String description;

  factory _$NewsDataModel([void updates(NewsDataModelBuilder b)]) =>
      (new NewsDataModelBuilder()..update(updates)).build();

  _$NewsDataModel._({this.title, this.url, this.description}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('NewsDataModel', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('NewsDataModel', 'url');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('NewsDataModel', 'description');
    }
  }

  @override
  NewsDataModel rebuild(void updates(NewsDataModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsDataModelBuilder toBuilder() => new NewsDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsDataModel &&
        title == other.title &&
        url == other.url &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, title.hashCode), url.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsDataModel')
          ..add('title', title)
          ..add('url', url)
          ..add('description', description))
        .toString();
  }
}

class NewsDataModelBuilder
    implements Builder<NewsDataModel, NewsDataModelBuilder> {
  _$NewsDataModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  NewsDataModelBuilder();

  NewsDataModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsDataModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsDataModel;
  }

  @override
  void update(void updates(NewsDataModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsDataModel build() {
    final _$result = _$v ??
        new _$NewsDataModel._(title: title, url: url, description: description);
    replace(_$result);
    return _$result;
  }
}
