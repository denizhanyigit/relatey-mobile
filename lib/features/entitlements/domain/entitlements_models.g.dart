// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlements_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntitlementsImpl _$$EntitlementsImplFromJson(Map<String, dynamic> json) =>
    _$EntitlementsImpl(
      hasPro: json['hasPro'] as bool? ?? false,
      credits: (json['credits'] as num?)?.toInt() ?? 0,
      expiresAt: (json['expiresAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EntitlementsImplToJson(_$EntitlementsImpl instance) =>
    <String, dynamic>{
      'hasPro': instance.hasPro,
      'credits': instance.credits,
      'expiresAt': instance.expiresAt,
      'updatedAt': instance.updatedAt,
    };

_$EntitlementsResponseImpl _$$EntitlementsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EntitlementsResponseImpl(
      hasPro: json['hasPro'] as bool,
      credits: (json['credits'] as num).toInt(),
      expiresAt: (json['expiresAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EntitlementsResponseImplToJson(
        _$EntitlementsResponseImpl instance) =>
    <String, dynamic>{
      'hasPro': instance.hasPro,
      'credits': instance.credits,
      'expiresAt': instance.expiresAt,
    };
