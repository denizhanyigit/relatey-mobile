import '../../../core/network/auth_interceptor.dart';
import '../../../core/utils/token_utils.dart';
import '../domain/auth_repository.dart';
import 'auth_api.dart';
import 'auth_models.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthApi api, required TokenStorage tokenStorage}) : _api = api, _tokenStorage = tokenStorage;
  final AuthApi _api;
  final TokenStorage _tokenStorage;
  
  @override
  Future<AuthTokenResponse> authenticateAnonymous({required String deviceId, String locale = 'tr'}) async {
    final response = await _api.authenticateAnonymous(deviceId: deviceId, locale: locale);
    await saveTokens(accessToken: response.accessToken, refreshToken: response.refreshToken);
    return response;
  }
  
  @override
  Future<AuthTokenResponse> refreshToken(String refreshToken) async {
    final response = await _api.refreshToken(refreshToken);
    await saveTokens(accessToken: response.accessToken, refreshToken: response.refreshToken);
    return response;
  }
  
  @override
  Future<String?> getAccessToken() => _tokenStorage.getAccessToken();
  @override
  Future<String?> getRefreshToken() => _tokenStorage.getRefreshToken();
  @override
  Future<void> saveTokens({required String accessToken, required String refreshToken}) => _tokenStorage.saveTokens(accessToken: accessToken, refreshToken: refreshToken);
  @override
  Future<void> clearTokens() => _tokenStorage.clearTokens();
  @override
  Future<bool> hasValidTokens() async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken == null) return false;
    return !TokenUtils.isTokenExpired(accessToken);
  }
}
