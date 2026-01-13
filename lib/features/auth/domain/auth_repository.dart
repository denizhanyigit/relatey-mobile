import '../data/auth_models.dart';

abstract class AuthRepository {
  Future<AuthTokenResponse> authenticateAnonymous({required String deviceId, String locale = 'tr'});
  Future<AuthTokenResponse> refreshToken(String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveTokens({required String accessToken, required String refreshToken});
  Future<void> clearTokens();
  Future<bool> hasValidTokens();
}
