import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/decisions_models.dart';
import '../domain/create_decision.dart';
import '../domain/decisions_repository.dart';

class CreateDecisionState {
  const CreateDecisionState({this.isLoading = false, this.error, this.createdDecision});
  final bool isLoading;
  final String? error;
  final DecisionModel? createdDecision;
  CreateDecisionState copyWith({bool? isLoading, String? error, DecisionModel? createdDecision}) => CreateDecisionState(isLoading: isLoading ?? this.isLoading, error: error, createdDecision: createdDecision ?? this.createdDecision);
}

class CreateDecisionController extends StateNotifier<CreateDecisionState> {
  CreateDecisionController({required CreateDecision createDecision}) : _createDecision = createDecision, super(const CreateDecisionState());
  final CreateDecision _createDecision;
  
  Future<DecisionModel?> create({required String situationType, required String contextText, String? personLabel}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final decision = await _createDecision(situationType: situationType, contextText: contextText, personLabel: personLabel);
      state = state.copyWith(isLoading: false, createdDecision: decision);
      return decision;
    } catch (e) { state = state.copyWith(isLoading: false, error: e.toString()); return null; }
  }
  
  void reset() { state = const CreateDecisionState(); }
}

class DecisionViewState {
  const DecisionViewState({this.decision, this.isLoadingPremium = false, this.premiumError});
  final DecisionModel? decision;
  final bool isLoadingPremium;
  final String? premiumError;
  DecisionViewState copyWith({DecisionModel? decision, bool? isLoadingPremium, String? premiumError}) => DecisionViewState(decision: decision ?? this.decision, isLoadingPremium: isLoadingPremium ?? this.isLoadingPremium, premiumError: premiumError);
}

class DecisionViewController extends StateNotifier<DecisionViewState> {
  DecisionViewController({required DecisionsRepository repository, required String decisionId}) : _repository = repository, _decisionId = decisionId, super(const DecisionViewState());
  final DecisionsRepository _repository;
  final String _decisionId;
  
  Future<void> load() async {
    final decision = await _repository.getDecision(_decisionId);
    state = state.copyWith(decision: decision);
  }
  
  Future<bool> unlockPremiumDetail() async {
    state = state.copyWith(isLoadingPremium: true, premiumError: null);
    try {
      final detailedText = await _repository.getPremiumDetail(_decisionId);
      final updatedDecision = state.decision?.copyWith(detailedText: detailedText);
      state = state.copyWith(decision: updatedDecision, isLoadingPremium: false);
      return true;
    } catch (e) { state = state.copyWith(isLoadingPremium: false, premiumError: e.toString()); return false; }
  }
}
