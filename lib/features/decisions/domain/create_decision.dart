import '../data/decisions_models.dart';
import 'decisions_repository.dart';

class CreateDecision {
  CreateDecision({required DecisionsRepository repository}) : _repository = repository;
  final DecisionsRepository _repository;
  
  Future<DecisionModel> call({required String situationType, required String contextText, String? personLabel}) async {
    if (contextText.trim().isEmpty) throw ArgumentError('Context text cannot be empty');
    if (contextText.length < 10) throw ArgumentError('Please provide more context (at least 10 characters)');
    return _repository.createDecision(situationType: situationType, contextText: contextText.trim(), personLabel: personLabel?.trim());
  }
}
