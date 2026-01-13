import 'dart:math';
import 'package:dio/dio.dart';
import '../../../core/config/endpoints.dart';
import '../../../core/config/env.dart';
import '../../../core/network/error_mapper.dart';
import 'decisions_models.dart';

class DecisionsApi {
  DecisionsApi(this._dio);
  final Dio _dio;
  
  Future<DecisionResponse> createDecision({required String situationType, required String contextText, String? personLabel}) async {
    if (Env.mockMode) return _mockCreateDecision(situationType: situationType, contextText: contextText, personLabel: personLabel);
    try {
      final response = await _dio.post(Endpoints.decisions, data: CreateDecisionRequest(situationType: situationType, contextText: contextText, personLabel: personLabel).toJson());
      return DecisionResponse.fromJson(response.data);
    } on DioException catch (e) { throw ErrorMapper.mapDioError(e); }
  }
  
  Future<PremiumDetailResponse> getPremiumDetail(String decisionId) async {
    if (Env.mockMode) return _mockGetPremiumDetail(decisionId);
    try {
      final response = await _dio.post(Endpoints.decisionPremium(decisionId));
      return PremiumDetailResponse.fromJson(response.data);
    } on DioException catch (e) { throw ErrorMapper.mapDioError(e); }
  }
  
  Future<DecisionResponse> getDecision(String decisionId) async {
    if (Env.mockMode) return _mockGetDecision(decisionId);
    try {
      final response = await _dio.get('${Endpoints.decisions}/$decisionId');
      return DecisionResponse.fromJson(response.data);
    } on DioException catch (e) { throw ErrorMapper.mapDioError(e); }
  }
  
  DecisionResponse _mockCreateDecision({required String situationType, required String contextText, String? personLabel}) {
    final id = 'decision_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
    final summaryText = _generateMockSummary(situationType);
    return DecisionResponse(id: id, situationType: situationType, contextText: contextText, personLabel: personLabel, summaryText: summaryText, detailedText: null, createdAt: DateTime.now().millisecondsSinceEpoch);
  }
  
  PremiumDetailResponse _mockGetPremiumDetail(String decisionId) => const PremiumDetailResponse(detailedText: '**Net Aksiyon Planı:**\nŞu an için beklemek en doğrusu. Karşı tarafın bir adım atmasını bekle.\n\n**Ne Söylemen Gerekiyor:**\nEğer iletişim kuracaksan, duygularını değil düşüncelerini paylaş.\n\n**Kaçınman Gerekenler:**\n- Sürekli mesaj atmak\n- Durumu sorgulamak\n- Baskı yapmak\n\n**Ek Bakışlar:**\nZamanlama açısından bu hafta kritik değil. Kendine odaklan.');
  
  DecisionResponse _mockGetDecision(String decisionId) => DecisionResponse(id: decisionId, situationType: 'should_message', contextText: 'Mock context', personLabel: null, summaryText: 'Mock summary text', detailedText: null, createdAt: DateTime.now().millisecondsSinceEpoch);
  
  String _generateMockSummary(String situationType) {
    final summaries = {'should_message': 'Şu an mesaj atmak için erken. Karşı tarafın son iletişiminden bu yana yeterli zaman geçmedi. Sabırlı ol ve önce onun adım atmasını bekle.', 'should_wait': 'Beklemek şu an en mantıklı seçim. Aceleci davranmak durumu daha karmaşık hale getirebilir. Kendi rutinine odaklan.', 'acting_indecisive': 'Karşı tarafın kararsızlığı seni yorabilir, ama bu onun iç çatışmasının yansıması. Sınırlarını koru ve net ol.', 'cant_trust': 'Güven sorunu yaşaman normal. Geçmiş deneyimler bu duyguyu tetiklemiş olabilir. Somut davranışlara odaklan.', 'should_end': 'İlişkiyi bitirmek kolay bir karar değil. Ama sürekli mutsuzluk hissediyorsan, kendine değer vermeyi unutma.'};
    return summaries[situationType] ?? 'Durumun karmaşık görünüyor ama netleşiyor. Detaylı yorumu görmek için premium erişim kullan.';
  }
}
