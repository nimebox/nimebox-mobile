// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

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

Serializer<NewsState> _$newsStateSerializer = new _$NewsStateSerializer();

class _$NewsStateSerializer implements StructuredSerializer<NewsState> {
  @override
  final Iterable<Type> types = const [NewsState, _$NewsState];
  @override
  final String wireName = 'NewsState';

  @override
  Iterable serialize(Serializers serializers, NewsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.news != null) {
      result
        ..add('news')
        ..add(serializers.serialize(object.news,
            specifiedType: const FullType(NewsModel)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  NewsState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'news':
          result.news.replace(serializers.deserialize(value,
              specifiedType: const FullType(NewsModel)) as NewsModel);
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsState extends NewsState {
  @override
  final NewsModel news;
  @override
  final bool isLoading;
  @override
  final String error;

  factory _$NewsState([void updates(NewsStateBuilder b)]) =>
      (new NewsStateBuilder()..update(updates)).build();

  _$NewsState._({this.news, this.isLoading, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('NewsState', 'isLoading');
    }
  }

  @override
  NewsState rebuild(void updates(NewsStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsStateBuilder toBuilder() => new NewsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsState &&
        news == other.news &&
        isLoading == other.isLoading &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, news.hashCode), isLoading.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsState')
          ..add('news', news)
          ..add('isLoading', isLoading)
          ..add('error', error))
        .toString();
  }
}

class NewsStateBuilder implements Builder<NewsState, NewsStateBuilder> {
  _$NewsState _$v;

  NewsModelBuilder _news;
  NewsModelBuilder get news => _$this._news ??= new NewsModelBuilder();
  set news(NewsModelBuilder news) => _$this._news = news;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  NewsStateBuilder();

  NewsStateBuilder get _$this {
    if (_$v != null) {
      _news = _$v.news?.toBuilder();
      _isLoading = _$v.isLoading;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NewsState;
  }

  @override
  void update(void updates(NewsStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsState build() {
    _$NewsState _$result;
    try {
      _$result = _$v ??
          new _$NewsState._(
              news: _news?.build(), isLoading: isLoading, error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'news';
        _news?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
