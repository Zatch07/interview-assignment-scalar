// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'interview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Interview _$InterviewFromJson(Map<String, dynamic> json) {
  return _Interview.fromJson(json);
}

/// @nodoc
mixin _$Interview {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  Set<String> get participants => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid, String name, DateTime start,
            DateTime end, Set<String> participants)
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uuid, String name, DateTime start, DateTime end,
            Set<String> participants)?
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid, String name, DateTime start, DateTime end,
            Set<String> participants)?
        raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Interview value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Interview value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Interview value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterviewCopyWith<Interview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewCopyWith<$Res> {
  factory $InterviewCopyWith(Interview value, $Res Function(Interview) then) =
      _$InterviewCopyWithImpl<$Res>;
  $Res call(
      {String uuid,
      String name,
      DateTime start,
      DateTime end,
      Set<String> participants});
}

/// @nodoc
class _$InterviewCopyWithImpl<$Res> implements $InterviewCopyWith<$Res> {
  _$InterviewCopyWithImpl(this._value, this._then);

  final Interview _value;
  // ignore: unused_field
  final $Res Function(Interview) _then;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? participants = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_InterviewCopyWith<$Res> implements $InterviewCopyWith<$Res> {
  factory _$$_InterviewCopyWith(
          _$_Interview value, $Res Function(_$_Interview) then) =
      __$$_InterviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uuid,
      String name,
      DateTime start,
      DateTime end,
      Set<String> participants});
}

/// @nodoc
class __$$_InterviewCopyWithImpl<$Res> extends _$InterviewCopyWithImpl<$Res>
    implements _$$_InterviewCopyWith<$Res> {
  __$$_InterviewCopyWithImpl(
      _$_Interview _value, $Res Function(_$_Interview) _then)
      : super(_value, (v) => _then(v as _$_Interview));

  @override
  _$_Interview get _value => super._value as _$_Interview;

  @override
  $Res call({
    Object? uuid = freezed,
    Object? name = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? participants = freezed,
  }) {
    return _then(_$_Interview(
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      participants: participants == freezed
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Interview extends _Interview with DiagnosticableTreeMixin {
  const _$_Interview(
      {required this.uuid,
      required this.name,
      required this.start,
      required this.end,
      final Set<String> participants = const {}})
      : _participants = participants,
        super._();

  factory _$_Interview.fromJson(Map<String, dynamic> json) =>
      _$$_InterviewFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final DateTime start;
  @override
  final DateTime end;
  final Set<String> _participants;
  @override
  @JsonKey()
  Set<String> get participants {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_participants);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Interview.raw(uuid: $uuid, name: $name, start: $start, end: $end, participants: $participants)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Interview.raw'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end))
      ..add(DiagnosticsProperty('participants', participants));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Interview &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  _$$_InterviewCopyWith<_$_Interview> get copyWith =>
      __$$_InterviewCopyWithImpl<_$_Interview>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid, String name, DateTime start,
            DateTime end, Set<String> participants)
        raw,
  }) {
    return raw(uuid, name, start, end, participants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uuid, String name, DateTime start, DateTime end,
            Set<String> participants)?
        raw,
  }) {
    return raw?.call(uuid, name, start, end, participants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid, String name, DateTime start, DateTime end,
            Set<String> participants)?
        raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(uuid, name, start, end, participants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Interview value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Interview value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Interview value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_InterviewToJson(
      this,
    );
  }
}

abstract class _Interview extends Interview {
  const factory _Interview(
      {required final String uuid,
      required final String name,
      required final DateTime start,
      required final DateTime end,
      final Set<String> participants}) = _$_Interview;
  const _Interview._() : super._();

  factory _Interview.fromJson(Map<String, dynamic> json) =
      _$_Interview.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  Set<String> get participants;
  @override
  @JsonKey(ignore: true)
  _$$_InterviewCopyWith<_$_Interview> get copyWith =>
      throw _privateConstructorUsedError;
}
