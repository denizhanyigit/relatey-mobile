// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entitlements_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Entitlements _$EntitlementsFromJson(Map<String, dynamic> json) {
  return _Entitlements.fromJson(json);
}

/// @nodoc
mixin _$Entitlements {
  bool get hasPro => throw _privateConstructorUsedError;
  int get credits => throw _privateConstructorUsedError;
  int? get expiresAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Entitlements to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Entitlements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntitlementsCopyWith<Entitlements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntitlementsCopyWith<$Res> {
  factory $EntitlementsCopyWith(
          Entitlements value, $Res Function(Entitlements) then) =
      _$EntitlementsCopyWithImpl<$Res, Entitlements>;
  @useResult
  $Res call({bool hasPro, int credits, int? expiresAt, int? updatedAt});
}

/// @nodoc
class _$EntitlementsCopyWithImpl<$Res, $Val extends Entitlements>
    implements $EntitlementsCopyWith<$Res> {
  _$EntitlementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Entitlements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPro = null,
    Object? credits = null,
    Object? expiresAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      hasPro: null == hasPro
          ? _value.hasPro
          : hasPro // ignore: cast_nullable_to_non_nullable
              as bool,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntitlementsImplCopyWith<$Res>
    implements $EntitlementsCopyWith<$Res> {
  factory _$$EntitlementsImplCopyWith(
          _$EntitlementsImpl value, $Res Function(_$EntitlementsImpl) then) =
      __$$EntitlementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasPro, int credits, int? expiresAt, int? updatedAt});
}

/// @nodoc
class __$$EntitlementsImplCopyWithImpl<$Res>
    extends _$EntitlementsCopyWithImpl<$Res, _$EntitlementsImpl>
    implements _$$EntitlementsImplCopyWith<$Res> {
  __$$EntitlementsImplCopyWithImpl(
      _$EntitlementsImpl _value, $Res Function(_$EntitlementsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Entitlements
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPro = null,
    Object? credits = null,
    Object? expiresAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EntitlementsImpl(
      hasPro: null == hasPro
          ? _value.hasPro
          : hasPro // ignore: cast_nullable_to_non_nullable
              as bool,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntitlementsImpl extends _Entitlements {
  const _$EntitlementsImpl(
      {this.hasPro = false, this.credits = 0, this.expiresAt, this.updatedAt})
      : super._();

  factory _$EntitlementsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntitlementsImplFromJson(json);

  @override
  @JsonKey()
  final bool hasPro;
  @override
  @JsonKey()
  final int credits;
  @override
  final int? expiresAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'Entitlements(hasPro: $hasPro, credits: $credits, expiresAt: $expiresAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntitlementsImpl &&
            (identical(other.hasPro, hasPro) || other.hasPro == hasPro) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hasPro, credits, expiresAt, updatedAt);

  /// Create a copy of Entitlements
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntitlementsImplCopyWith<_$EntitlementsImpl> get copyWith =>
      __$$EntitlementsImplCopyWithImpl<_$EntitlementsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntitlementsImplToJson(
      this,
    );
  }
}

abstract class _Entitlements extends Entitlements {
  const factory _Entitlements(
      {final bool hasPro,
      final int credits,
      final int? expiresAt,
      final int? updatedAt}) = _$EntitlementsImpl;
  const _Entitlements._() : super._();

  factory _Entitlements.fromJson(Map<String, dynamic> json) =
      _$EntitlementsImpl.fromJson;

  @override
  bool get hasPro;
  @override
  int get credits;
  @override
  int? get expiresAt;
  @override
  int? get updatedAt;

  /// Create a copy of Entitlements
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntitlementsImplCopyWith<_$EntitlementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EntitlementsResponse _$EntitlementsResponseFromJson(Map<String, dynamic> json) {
  return _EntitlementsResponse.fromJson(json);
}

/// @nodoc
mixin _$EntitlementsResponse {
  bool get hasPro => throw _privateConstructorUsedError;
  int get credits => throw _privateConstructorUsedError;
  int? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this EntitlementsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EntitlementsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntitlementsResponseCopyWith<EntitlementsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntitlementsResponseCopyWith<$Res> {
  factory $EntitlementsResponseCopyWith(EntitlementsResponse value,
          $Res Function(EntitlementsResponse) then) =
      _$EntitlementsResponseCopyWithImpl<$Res, EntitlementsResponse>;
  @useResult
  $Res call({bool hasPro, int credits, int? expiresAt});
}

/// @nodoc
class _$EntitlementsResponseCopyWithImpl<$Res,
        $Val extends EntitlementsResponse>
    implements $EntitlementsResponseCopyWith<$Res> {
  _$EntitlementsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntitlementsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPro = null,
    Object? credits = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      hasPro: null == hasPro
          ? _value.hasPro
          : hasPro // ignore: cast_nullable_to_non_nullable
              as bool,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntitlementsResponseImplCopyWith<$Res>
    implements $EntitlementsResponseCopyWith<$Res> {
  factory _$$EntitlementsResponseImplCopyWith(_$EntitlementsResponseImpl value,
          $Res Function(_$EntitlementsResponseImpl) then) =
      __$$EntitlementsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasPro, int credits, int? expiresAt});
}

/// @nodoc
class __$$EntitlementsResponseImplCopyWithImpl<$Res>
    extends _$EntitlementsResponseCopyWithImpl<$Res, _$EntitlementsResponseImpl>
    implements _$$EntitlementsResponseImplCopyWith<$Res> {
  __$$EntitlementsResponseImplCopyWithImpl(_$EntitlementsResponseImpl _value,
      $Res Function(_$EntitlementsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntitlementsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasPro = null,
    Object? credits = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$EntitlementsResponseImpl(
      hasPro: null == hasPro
          ? _value.hasPro
          : hasPro // ignore: cast_nullable_to_non_nullable
              as bool,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntitlementsResponseImpl implements _EntitlementsResponse {
  const _$EntitlementsResponseImpl(
      {required this.hasPro, required this.credits, this.expiresAt});

  factory _$EntitlementsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntitlementsResponseImplFromJson(json);

  @override
  final bool hasPro;
  @override
  final int credits;
  @override
  final int? expiresAt;

  @override
  String toString() {
    return 'EntitlementsResponse(hasPro: $hasPro, credits: $credits, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntitlementsResponseImpl &&
            (identical(other.hasPro, hasPro) || other.hasPro == hasPro) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasPro, credits, expiresAt);

  /// Create a copy of EntitlementsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntitlementsResponseImplCopyWith<_$EntitlementsResponseImpl>
      get copyWith =>
          __$$EntitlementsResponseImplCopyWithImpl<_$EntitlementsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntitlementsResponseImplToJson(
      this,
    );
  }
}

abstract class _EntitlementsResponse implements EntitlementsResponse {
  const factory _EntitlementsResponse(
      {required final bool hasPro,
      required final int credits,
      final int? expiresAt}) = _$EntitlementsResponseImpl;

  factory _EntitlementsResponse.fromJson(Map<String, dynamic> json) =
      _$EntitlementsResponseImpl.fromJson;

  @override
  bool get hasPro;
  @override
  int get credits;
  @override
  int? get expiresAt;

  /// Create a copy of EntitlementsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntitlementsResponseImplCopyWith<_$EntitlementsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
