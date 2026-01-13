/// API endpoint constants.
abstract final class Endpoints {
  static const String authAnonymous = '/v1/auth/anonymous';
  static const String authRefresh = '/v1/auth/refresh';
  static const String entitlements = '/v1/entitlements';
  static const String decisions = '/v1/decisions';
  
  static String decisionPremium(String id) => '/v1/decisions/$id/premium';
}
