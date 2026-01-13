import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/access_policy.dart';
import '../domain/entitlements_models.dart';
import '../domain/entitlements_repository.dart';

class EntitlementsState {
  const EntitlementsState({this.entitlements, this.isLoading = false, this.error});
  final Entitlements? entitlements;
  final bool isLoading;
  final String? error;
  bool get hasPro => entitlements?.hasPro ?? false;
  int get credits => entitlements?.credits ?? 0;
  bool get hasData => entitlements != null;
  EntitlementsState copyWith({Entitlements? entitlements, bool? isLoading, String? error}) => EntitlementsState(entitlements: entitlements ?? this.entitlements, isLoading: isLoading ?? this.isLoading, error: error);
}

class EntitlementsController extends StateNotifier<EntitlementsState> {
  EntitlementsController({required EntitlementsRepository repository}) : _repository = repository, super(const EntitlementsState());
  final EntitlementsRepository _repository;
  
  Future<void> loadFromCache() async {
    final cached = await _repository.getCachedEntitlements();
    if (cached != null) state = state.copyWith(entitlements: cached);
  }
  
  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final entitlements = await _repository.fetchEntitlements();
      state = state.copyWith(entitlements: entitlements, isLoading: false);
    } catch (e) { state = state.copyWith(isLoading: false, error: e.toString()); }
  }
  
  bool canUnlockPremiumDetail() => AccessPolicy.canUnlockPremiumDetail(hasPro: state.hasPro, credits: state.credits);
  AccessResult checkPremiumDetailAccess() => AccessPolicy.checkPremiumDetailAccess(hasPro: state.hasPro, credits: state.credits);
  Future<void> deductCredits(int amount) async { await _repository.deductCredits(amount); await loadFromCache(); }
  Future<void> addCredits(int amount) async { await _repository.addCredits(amount); await loadFromCache(); }
  bool canUseLens(String lensType) => AccessPolicy.canUseLens(lensType: lensType, hasPro: state.hasPro, credits: state.credits);
}
