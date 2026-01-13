import '../data/decisions_models.dart';

abstract class DecisionsRepository {
  Future<DecisionModel> createDecision({required String situationType, required String contextText, String? personLabel});
  Future<String> getPremiumDetail(String decisionId);
  Future<DecisionModel?> getDecision(String decisionId);
  Stream<DecisionModel?> getDecisionStream(String decisionId);
  Stream<List<DecisionModel>> getAllDecisionsStream();
}
