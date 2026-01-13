import 'package:freezed_annotation/freezed_annotation.dart';

part 'decisions_models.freezed.dart';
part 'decisions_models.g.dart';

enum SituationType {
  shouldMessage('should_message', 'Mesaj atmalı mıyım?'),
  shouldWait('should_wait', 'Beklemek mi daha doğru?'),
  actingIndecisive('acting_indecisive', 'Kararsız davranıyor'),
  cantTrust('cant_trust', 'Güvenemiyorum'),
  shouldEnd('should_end', 'Bitirmeli miyim?');
  
  const SituationType(this.key, this.displayName);
  final String key;
  final String displayName;
  static SituationType fromKey(String key) => SituationType.values.firstWhere((e) => e.key == key, orElse: () => SituationType.shouldMessage);
}

@freezed
class CreateDecisionRequest with _$CreateDecisionRequest {
  const factory CreateDecisionRequest({required String situationType, required String contextText, String? personLabel}) = _CreateDecisionRequest;
  factory CreateDecisionRequest.fromJson(Map<String, dynamic> json) => _$CreateDecisionRequestFromJson(json);
}

@freezed
class DecisionResponse with _$DecisionResponse {
  const factory DecisionResponse({required String id, required String situationType, required String contextText, String? personLabel, required String summaryText, String? detailedText, required int createdAt}) = _DecisionResponse;
  factory DecisionResponse.fromJson(Map<String, dynamic> json) => _$DecisionResponseFromJson(json);
}

@freezed
class DecisionModel with _$DecisionModel {
  const DecisionModel._();
  const factory DecisionModel({required String id, required String situationType, required String contextText, String? personLabel, required String summaryText, String? detailedText, required int createdAt}) = _DecisionModel;
  factory DecisionModel.fromJson(Map<String, dynamic> json) => _$DecisionModelFromJson(json);
  factory DecisionModel.fromResponse(DecisionResponse response) => DecisionModel(id: response.id, situationType: response.situationType, contextText: response.contextText, personLabel: response.personLabel, summaryText: response.summaryText, detailedText: response.detailedText, createdAt: response.createdAt);
  bool get hasDetailedText => detailedText != null && detailedText!.isNotEmpty;
  SituationType get situationTypeEnum => SituationType.fromKey(situationType);
}

@freezed
class PremiumDetailResponse with _$PremiumDetailResponse {
  const factory PremiumDetailResponse({required String detailedText}) = _PremiumDetailResponse;
  factory PremiumDetailResponse.fromJson(Map<String, dynamic> json) => _$PremiumDetailResponseFromJson(json);
}
