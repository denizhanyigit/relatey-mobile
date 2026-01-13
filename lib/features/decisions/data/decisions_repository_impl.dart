import '../../../core/storage/db.dart';
import '../domain/decisions_repository.dart';
import 'decisions_api.dart';
import 'decisions_models.dart';

class DecisionsRepositoryImpl implements DecisionsRepository {
  DecisionsRepositoryImpl({required DecisionsApi api, required AppDatabase database}) : _api = api, _database = database;
  final DecisionsApi _api;
  final AppDatabase _database;
  
  @override
  Future<DecisionModel> createDecision({required String situationType, required String contextText, String? personLabel}) async {
    final response = await _api.createDecision(situationType: situationType, contextText: contextText, personLabel: personLabel);
    final decision = DecisionModel.fromResponse(response);
    await _database.upsertDecisionSummary(id: decision.id, situationType: decision.situationType, contextText: decision.contextText, personLabel: decision.personLabel, summaryText: decision.summaryText);
    return decision;
  }
  
  @override
  Future<String> getPremiumDetail(String decisionId) async {
    final response = await _api.getPremiumDetail(decisionId);
    await _database.updateDecisionDetailedText(id: decisionId, detailedText: response.detailedText);
    return response.detailedText;
  }
  
  @override
  Future<DecisionModel?> getDecision(String decisionId) async {
    final local = await _database.getDecisionById(decisionId);
    if (local != null) return DecisionModel(id: local.id, situationType: local.situationType, contextText: local.contextText, personLabel: local.personLabel, summaryText: local.summaryText, detailedText: local.detailedText, createdAt: local.createdAt);
    final response = await _api.getDecision(decisionId);
    return DecisionModel.fromResponse(response);
  }
  
  @override
  Stream<DecisionModel?> getDecisionStream(String decisionId) => _database.getDecisionByIdStream(decisionId).map((local) => local == null ? null : DecisionModel(id: local.id, situationType: local.situationType, contextText: local.contextText, personLabel: local.personLabel, summaryText: local.summaryText, detailedText: local.detailedText, createdAt: local.createdAt));
  
  @override
  Stream<List<DecisionModel>> getAllDecisionsStream() => _database.getAllDecisionsStream().map((decisions) => decisions.map((local) => DecisionModel(id: local.id, situationType: local.situationType, contextText: local.contextText, personLabel: local.personLabel, summaryText: local.summaryText, detailedText: local.detailedText, createdAt: local.createdAt)).toList());
}
