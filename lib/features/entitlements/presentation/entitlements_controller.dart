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

  /// Generic access check using centralized AccessPolicy.
  AccessResult checkAccess(AccessAction action) => AccessPolicy.checkAccess(
    action: action,
    hasPro: state.hasPro,
    credits: state.credits,
  );

  /// Convenience: check if user can perform action.
  bool canAccess(AccessAction action) => AccessPolicy.canAccess(
    action: action,
    hasPro: state.hasPro,
    credits: state.credits,
  );

  /// DEV ONLY: Simulate credit addition for testing.
  Future<void> addCredits(int amount) async {
    await _repository.addCredits(amount);
    await loadFromCache();
  }
}
