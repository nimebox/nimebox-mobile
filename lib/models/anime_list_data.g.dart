// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_list_data.dart';

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

class _$AnimeListDataModel extends AnimeListDataModel {
  @override
  final String title;
  @override
  final String url;
  @override
  final String image;

  factory _$AnimeListDataModel([void updates(AnimeListDataModelBuilder b)]) =>
      (new AnimeListDataModelBuilder()..update(updates)).build();

  _$AnimeListDataModel._({this.title, this.url, this.image}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('AnimeListDataModel', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('AnimeListDataModel', 'url');
    }
    if (image == null) {
      throw new BuiltValueNullFieldError('AnimeListDataModel', 'image');
    }
  }

  @override
  AnimeListDataModel rebuild(void updates(AnimeListDataModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeListDataModelBuilder toBuilder() =>
      new AnimeListDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeListDataModel &&
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
    return (newBuiltValueToStringHelper('AnimeListDataModel')
          ..add('title', title)
          ..add('url', url)
          ..add('image', image))
        .toString();
  }
}

class AnimeListDataModelBuilder
    implements Builder<AnimeListDataModel, AnimeListDataModelBuilder> {
  _$AnimeListDataModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  AnimeListDataModelBuilder();

  AnimeListDataModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeListDataModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeListDataModel;
  }

  @override
  void update(void updates(AnimeListDataModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeListDataModel build() {
    final _$result =
        _$v ?? new _$AnimeListDataModel._(title: title, url: url, image: image);
    replace(_$result);
    return _$result;
  }
}
