// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decisions_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateDecisionRequestImpl _$$CreateDecisionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateDecisionRequestImpl(
      situationType: json['situationType'] as String,
      contextText: json['contextText'] as String,
      personLabel: json['personLabel'] as String?,
    );

Map<String, dynamic> _$$CreateDecisionRequestImplToJson(
        _$CreateDecisionRequestImpl instance) =>
    <String, dynamic>{
      'situationType': instance.situationType,
      'contextText': instance.contextText,
      'personLabel': instance.personLabel,
    };

_$DecisionResponseImpl _$$DecisionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DecisionResponseImpl(
      id: json['id'] as String,
      situationType: json['situationType'] as String,
      contextText: json['contextText'] as String,
      personLabel: json['personLabel'] as String?,
      summaryText: json['summaryText'] as String,
      detailedText: json['detailedText'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$$DecisionResponseImplToJson(
        _$DecisionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'situationType': instance.situationType,
      'contextText': instance.contextText,
      'personLabel': instance.personLabel,
      'summaryText': instance.summaryText,
      'detailedText': instance.detailedText,
      'createdAt': instance.createdAt,
    };

_$DecisionModelImpl _$$DecisionModelImplFromJson(Map<String, dynamic> json) =>
    _$DecisionModelImpl(
      id: json['id'] as String,
      situationType: json['situationType'] as String,
      contextText: json['contextText'] as String,
      personLabel: json['personLabel'] as String?,
      summaryText: json['summaryText'] as String,
      detailedText: json['detailedText'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$$DecisionModelImplToJson(_$DecisionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'situationType': instance.situationType,
      'contextText': instance.contextText,
      'personLabel': instance.personLabel,
      'summaryText': instance.summaryText,
      'detailedText': instance.detailedText,
      'createdAt': instance.createdAt,
    };

_$PremiumDetailResponseImpl _$$PremiumDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PremiumDetailResponseImpl(
      detailedText: json['detailedText'] as String,
    );

Map<String, dynamic> _$$PremiumDetailResponseImplToJson(
        _$PremiumDetailResponseImpl instance) =>
    <String, dynamic>{
      'detailedText': instance.detailedText,
    };
