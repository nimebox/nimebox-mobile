// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

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

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'newsState',
      serializers.serialize(object.newsState,
          specifiedType: const FullType(NewsState)),
      'animeListState',
      serializers.serialize(object.animeListState,
          specifiedType: const FullType(AnimeListState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'newsState':
          result.newsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(NewsState)) as NewsState);
          break;
        case 'animeListState':
          result.animeListState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AnimeListState)) as AnimeListState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final NewsState newsState;
  @override
  final AnimeListState animeListState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.newsState, this.animeListState}) : super._() {
    if (newsState == null) {
      throw new BuiltValueNullFieldError('AppState', 'newsState');
    }
    if (animeListState == null) {
      throw new BuiltValueNullFieldError('AppState', 'animeListState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        newsState == other.newsState &&
        animeListState == other.animeListState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, newsState.hashCode), animeListState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('newsState', newsState)
          ..add('animeListState', animeListState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  NewsStateBuilder _newsState;
  NewsStateBuilder get newsState =>
      _$this._newsState ??= new NewsStateBuilder();
  set newsState(NewsStateBuilder newsState) => _$this._newsState = newsState;

  AnimeListStateBuilder _animeListState;
  AnimeListStateBuilder get animeListState =>
      _$this._animeListState ??= new AnimeListStateBuilder();
  set animeListState(AnimeListStateBuilder animeListState) =>
      _$this._animeListState = animeListState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _newsState = _$v.newsState?.toBuilder();
      _animeListState = _$v.animeListState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              newsState: newsState.build(),
              animeListState: animeListState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'newsState';
        newsState.build();
        _$failedField = 'animeListState';
        animeListState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
