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

Serializer<AnimeListState> _$animeListStateSerializer =
    new _$AnimeListStateSerializer();

class _$AnimeListStateSerializer
    implements StructuredSerializer<AnimeListState> {
  @override
  final Iterable<Type> types = const [AnimeListState, _$AnimeListState];
  @override
  final String wireName = 'AnimeListState';

  @override
  Iterable serialize(Serializers serializers, AnimeListState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.animeList != null) {
      result
        ..add('animeList')
        ..add(serializers.serialize(object.animeList,
            specifiedType: const FullType(AnimeListModel)));
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
  AnimeListState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeListStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'animeList':
          result.animeList.replace(serializers.deserialize(value,
              specifiedType: const FullType(AnimeListModel)) as AnimeListModel);
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

class _$AnimeListState extends AnimeListState {
  @override
  final AnimeListModel animeList;
  @override
  final bool isLoading;
  @override
  final String error;

  factory _$AnimeListState([void updates(AnimeListStateBuilder b)]) =>
      (new AnimeListStateBuilder()..update(updates)).build();

  _$AnimeListState._({this.animeList, this.isLoading, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AnimeListState', 'isLoading');
    }
  }

  @override
  AnimeListState rebuild(void updates(AnimeListStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeListStateBuilder toBuilder() =>
      new AnimeListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeListState &&
        animeList == other.animeList &&
        isLoading == other.isLoading &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, animeList.hashCode), isLoading.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeListState')
          ..add('animeList', animeList)
          ..add('isLoading', isLoading)
          ..add('error', error))
        .toString();
  }
}

class AnimeListStateBuilder
    implements Builder<AnimeListState, AnimeListStateBuilder> {
  _$AnimeListState _$v;

  AnimeListModelBuilder _animeList;
  AnimeListModelBuilder get animeList =>
      _$this._animeList ??= new AnimeListModelBuilder();
  set animeList(AnimeListModelBuilder animeList) =>
      _$this._animeList = animeList;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  AnimeListStateBuilder();

  AnimeListStateBuilder get _$this {
    if (_$v != null) {
      _animeList = _$v.animeList?.toBuilder();
      _isLoading = _$v.isLoading;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeListState;
  }

  @override
  void update(void updates(AnimeListStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeListState build() {
    _$AnimeListState _$result;
    try {
      _$result = _$v ??
          new _$AnimeListState._(
              animeList: _animeList?.build(),
              isLoading: isLoading,
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'animeList';
        _animeList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AnimeListState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
