// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnonymousAuthRequest _$AnonymousAuthRequestFromJson(Map<String, dynamic> json) {
  return _AnonymousAuthRequest.fromJson(json);
}

/// @nodoc
mixin _$AnonymousAuthRequest {
  String get deviceId => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;

  /// Serializes this AnonymousAuthRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnonymousAuthRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnonymousAuthRequestCopyWith<AnonymousAuthRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnonymousAuthRequestCopyWith<$Res> {
  factory $AnonymousAuthRequestCopyWith(AnonymousAuthRequest value,
          $Res Function(AnonymousAuthRequest) then) =
      _$AnonymousAuthRequestCopyWithImpl<$Res, AnonymousAuthRequest>;
  @useResult
  $Res call({String deviceId, String locale});
}

/// @nodoc
class _$AnonymousAuthRequestCopyWithImpl<$Res,
        $Val extends AnonymousAuthRequest>
    implements $AnonymousAuthRequestCopyWith<$Res> {
  _$AnonymousAuthRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnonymousAuthRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnonymousAuthRequestImplCopyWith<$Res>
    implements $AnonymousAuthRequestCopyWith<$Res> {
  factory _$$AnonymousAuthRequestImplCopyWith(_$AnonymousAuthRequestImpl value,
          $Res Function(_$AnonymousAuthRequestImpl) then) =
      __$$AnonymousAuthRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, String locale});
}

/// @nodoc
class __$$AnonymousAuthRequestImplCopyWithImpl<$Res>
    extends _$AnonymousAuthRequestCopyWithImpl<$Res, _$AnonymousAuthRequestImpl>
    implements _$$AnonymousAuthRequestImplCopyWith<$Res> {
  __$$AnonymousAuthRequestImplCopyWithImpl(_$AnonymousAuthRequestImpl _value,
      $Res Function(_$AnonymousAuthRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnonymousAuthRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? locale = null,
  }) {
    return _then(_$AnonymousAuthRequestImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnonymousAuthRequestImpl implements _AnonymousAuthRequest {
  const _$AnonymousAuthRequestImpl(
      {required this.deviceId, this.locale = 'tr'});

  factory _$AnonymousAuthRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnonymousAuthRequestImplFromJson(json);

  @override
  final String deviceId;
  @override
  @JsonKey()
  final String locale;

  @override
  String toString() {
    return 'AnonymousAuthRequest(deviceId: $deviceId, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnonymousAuthRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, locale);

  /// Create a copy of AnonymousAuthRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnonymousAuthRequestImplCopyWith<_$AnonymousAuthRequestImpl>
      get copyWith =>
          __$$AnonymousAuthRequestImplCopyWithImpl<_$AnonymousAuthRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnonymousAuthRequestImplToJson(
      this,
    );
  }
}

abstract class _AnonymousAuthRequest implements AnonymousAuthRequest {
  const factory _AnonymousAuthRequest(
      {required final String deviceId,
      final String locale}) = _$AnonymousAuthRequestImpl;

  factory _AnonymousAuthRequest.fromJson(Map<String, dynamic> json) =
      _$AnonymousAuthRequestImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get locale;

  /// Create a copy of AnonymousAuthRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnonymousAuthRequestImplCopyWith<_$AnonymousAuthRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) {
  return _AuthTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this AuthTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokenResponseCopyWith<AuthTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenResponseCopyWith<$Res> {
  factory $AuthTokenResponseCopyWith(
          AuthTokenResponse value, $Res Function(AuthTokenResponse) then) =
      _$AuthTokenResponseCopyWithImpl<$Res, AuthTokenResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$AuthTokenResponseCopyWithImpl<$Res, $Val extends AuthTokenResponse>
    implements $AuthTokenResponseCopyWith<$Res> {
  _$AuthTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthTokenResponseImplCopyWith<$Res>
    implements $AuthTokenResponseCopyWith<$Res> {
  factory _$$AuthTokenResponseImplCopyWith(_$AuthTokenResponseImpl value,
          $Res Function(_$AuthTokenResponseImpl) then) =
      __$$AuthTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$AuthTokenResponseImplCopyWithImpl<$Res>
    extends _$AuthTokenResponseCopyWithImpl<$Res, _$AuthTokenResponseImpl>
    implements _$$AuthTokenResponseImplCopyWith<$Res> {
  __$$AuthTokenResponseImplCopyWithImpl(_$AuthTokenResponseImpl _value,
      $Res Function(_$AuthTokenResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$AuthTokenResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenResponseImpl implements _AuthTokenResponse {
  const _$AuthTokenResponseImpl(
      {required this.accessToken, required this.refreshToken});

  factory _$AuthTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthTokenResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of AuthTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenResponseImplCopyWith<_$AuthTokenResponseImpl> get copyWith =>
      __$$AuthTokenResponseImplCopyWithImpl<_$AuthTokenResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthTokenResponse implements AuthTokenResponse {
  const factory _AuthTokenResponse(
      {required final String accessToken,
      required final String refreshToken}) = _$AuthTokenResponseImpl;

  factory _AuthTokenResponse.fromJson(Map<String, dynamic> json) =
      _$AuthTokenResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of AuthTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokenResponseImplCopyWith<_$AuthTokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) {
  return _RefreshTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenRequest {
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenRequestCopyWith<RefreshTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenRequestCopyWith<$Res> {
  factory $RefreshTokenRequestCopyWith(
          RefreshTokenRequest value, $Res Function(RefreshTokenRequest) then) =
      _$RefreshTokenRequestCopyWithImpl<$Res, RefreshTokenRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$RefreshTokenRequestCopyWithImpl<$Res, $Val extends RefreshTokenRequest>
    implements $RefreshTokenRequestCopyWith<$Res> {
  _$RefreshTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenRequestImplCopyWith<$Res>
    implements $RefreshTokenRequestCopyWith<$Res> {
  factory _$$RefreshTokenRequestImplCopyWith(_$RefreshTokenRequestImpl value,
          $Res Function(_$RefreshTokenRequestImpl) then) =
      __$$RefreshTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$RefreshTokenRequestImplCopyWithImpl<$Res>
    extends _$RefreshTokenRequestCopyWithImpl<$Res, _$RefreshTokenRequestImpl>
    implements _$$RefreshTokenRequestImplCopyWith<$Res> {
  __$$RefreshTokenRequestImplCopyWithImpl(_$RefreshTokenRequestImpl _value,
      $Res Function(_$RefreshTokenRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenRequestImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenRequestImpl implements _RefreshTokenRequest {
  const _$RefreshTokenRequestImpl({required this.refreshToken});

  factory _$RefreshTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenRequestImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenRequestImplCopyWith<_$RefreshTokenRequestImpl> get copyWith =>
      __$$RefreshTokenRequestImplCopyWithImpl<_$RefreshTokenRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenRequestImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenRequest implements RefreshTokenRequest {
  const factory _RefreshTokenRequest({required final String refreshToken}) =
      _$RefreshTokenRequestImpl;

  factory _RefreshTokenRequest.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenRequestImpl.fromJson;

  @override
  String get refreshToken;

  /// Create a copy of RefreshTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenRequestImplCopyWith<_$RefreshTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
