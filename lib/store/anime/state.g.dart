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

Serializer<AnimeState> _$animeStateSerializer = new _$AnimeStateSerializer();

class _$AnimeStateSerializer implements StructuredSerializer<AnimeState> {
  @override
  final Iterable<Type> types = const [AnimeState, _$AnimeState];
  @override
  final String wireName = 'AnimeState';

  @override
  Iterable serialize(Serializers serializers, AnimeState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.anime != null) {
      result
        ..add('anime')
        ..add(serializers.serialize(object.anime,
            specifiedType: const FullType(AnimeModel)));
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
  AnimeState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnimeStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'anime':
          result.anime.replace(serializers.deserialize(value,
              specifiedType: const FullType(AnimeModel)) as AnimeModel);
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

class _$AnimeState extends AnimeState {
  @override
  final AnimeModel anime;
  @override
  final bool isLoading;
  @override
  final String error;

  factory _$AnimeState([void updates(AnimeStateBuilder b)]) =>
      (new AnimeStateBuilder()..update(updates)).build();

  _$AnimeState._({this.anime, this.isLoading, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AnimeState', 'isLoading');
    }
  }

  @override
  AnimeState rebuild(void updates(AnimeStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AnimeStateBuilder toBuilder() => new AnimeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnimeState &&
        anime == other.anime &&
        isLoading == other.isLoading &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, anime.hashCode), isLoading.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AnimeState')
          ..add('anime', anime)
          ..add('isLoading', isLoading)
          ..add('error', error))
        .toString();
  }
}

class AnimeStateBuilder implements Builder<AnimeState, AnimeStateBuilder> {
  _$AnimeState _$v;

  AnimeModelBuilder _anime;
  AnimeModelBuilder get anime => _$this._anime ??= new AnimeModelBuilder();
  set anime(AnimeModelBuilder anime) => _$this._anime = anime;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  AnimeStateBuilder();

  AnimeStateBuilder get _$this {
    if (_$v != null) {
      _anime = _$v.anime?.toBuilder();
      _isLoading = _$v.isLoading;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnimeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AnimeState;
  }

  @override
  void update(void updates(AnimeStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AnimeState build() {
    _$AnimeState _$result;
    try {
      _$result = _$v ??
          new _$AnimeState._(
              anime: _anime?.build(), isLoading: isLoading, error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'anime';
        _anime?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AnimeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
