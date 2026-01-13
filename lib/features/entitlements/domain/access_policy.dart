abstract final class AccessPolicy {
  static const int premiumDetailCost = 1;
  static const int lensCost = 1;
  
  static bool canUnlockPremiumDetail({required bool hasPro, required int credits}) => hasPro || credits >= premiumDetailCost;
  
  static bool canUseLens({required String lensType, required bool hasPro, required int credits}) {
    if (hasPro) return true;
    return credits >= lensCost;
  }
  
  static int costFor(String action) => switch (action) { 'premium_detail' => premiumDetailCost, 'lens' => lensCost, _ => 1 };
  
  static bool needsPaywallForPremiumDetail({required bool hasPro, required int credits}) => !canUnlockPremiumDetail(hasPro: hasPro, credits: credits);
  
  static AccessResult checkPremiumDetailAccess({required bool hasPro, required int credits}) {
    if (hasPro) return const AccessResult.allowed(reason: 'Pro subscription');
    if (credits >= premiumDetailCost) return AccessResult.allowed(reason: 'Credits available', creditsToDeduct: premiumDetailCost);
    return const AccessResult.denied(reason: 'PAYWALL_REQUIRED', action: 'premium_detail');
  }
}

sealed class AccessResult {
  const AccessResult();
  const factory AccessResult.allowed({required String reason, int creditsToDeduct}) = AccessAllowed;
  const factory AccessResult.denied({required String reason, String? action, String? decisionId}) = AccessDenied;
}

final class AccessAllowed extends AccessResult {
  const AccessAllowed({required this.reason, this.creditsToDeduct = 0});
  final String reason;
  final int creditsToDeduct;
}

final class AccessDenied extends AccessResult {
  const AccessDenied({required this.reason, this.action, this.decisionId});
  final String reason;
  final String? action;
  final String? decisionId;
}
