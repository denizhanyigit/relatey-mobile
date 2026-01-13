// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnonymousAuthRequestImpl _$$AnonymousAuthRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AnonymousAuthRequestImpl(
      deviceId: json['deviceId'] as String,
      locale: json['locale'] as String? ?? 'tr',
    );

Map<String, dynamic> _$$AnonymousAuthRequestImplToJson(
        _$AnonymousAuthRequestImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'locale': instance.locale,
    };

_$AuthTokenResponseImpl _$$AuthTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthTokenResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthTokenResponseImplToJson(
        _$AuthTokenResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_$RefreshTokenRequestImpl _$$RefreshTokenRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenRequestImpl(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$RefreshTokenRequestImplToJson(
        _$RefreshTokenRequestImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };
