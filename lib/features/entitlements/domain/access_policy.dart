/// All gated actions in the app.
enum AccessAction {
  premiumDetail,
  lens,
}

/// Centralized access control. ALL paywall decisions go through this class.
abstract final class AccessPolicy {
  static const int _premiumDetailCost = 1;
  static const int _lensCost = 1;

  /// Returns the credit cost for a given action.
  /// Throws [ArgumentError] for unknown actions (fail-fast).
  static int costFor(AccessAction action) {
    return switch (action) {
      AccessAction.premiumDetail => _premiumDetailCost,
      AccessAction.lens => _lensCost,
    };
  }

  /// Generic access check. All UI/controller gating must use this method.
  static AccessResult checkAccess({
    required AccessAction action,
    required bool hasPro,
    required int credits,
  }) {
    if (hasPro) {
      return const AccessResult.allowed(reason: 'Pro subscription');
    }
    final cost = costFor(action);
    if (credits >= cost) {
      return AccessResult.allowed(
        reason: 'Credits available',
        creditsToDeduct: cost,
      );
    }
    return AccessResult.denied(reason: 'PAYWALL_REQUIRED', action: action);
  }

  /// Convenience: checks if user can access without going through full result.
  static bool canAccess({
    required AccessAction action,
    required bool hasPro,
    required int credits,
  }) {
    final result = checkAccess(action: action, hasPro: hasPro, credits: credits);
    return result is AccessAllowed;
  }

  /// Convenience: checks if paywall is needed.
  static bool needsPaywall({
    required AccessAction action,
    required bool hasPro,
    required int credits,
  }) {
    return !canAccess(action: action, hasPro: hasPro, credits: credits);
  }
}

sealed class AccessResult {
  const AccessResult();
  const factory AccessResult.allowed({
    required String reason,
    int creditsToDeduct,
  }) = AccessAllowed;
  const factory AccessResult.denied({
    required String reason,
    AccessAction? action,
    String? decisionId,
  }) = AccessDenied;
}

final class AccessAllowed extends AccessResult {
  const AccessAllowed({required this.reason, this.creditsToDeduct = 0});
  final String reason;
  final int creditsToDeduct;
}

final class AccessDenied extends AccessResult {
  const AccessDenied({required this.reason, this.action, this.decisionId});
  final String reason;
  final AccessAction? action;
  final String? decisionId;
}
