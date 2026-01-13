import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../core/config/endpoints.dart';
import '../../../core/config/env.dart';
import '../../../core/network/error_mapper.dart';
import 'auth_models.dart';

class AuthApi {
  AuthApi(this._dio);
  final Dio _dio;
  
  Future<AuthTokenResponse> authenticateAnonymous({required String deviceId, String locale = 'tr'}) async {
    if (Env.mockMode) return _mockAnonymousAuth();
    try {
      final response = await _dio.post(Endpoints.authAnonymous, data: AnonymousAuthRequest(deviceId: deviceId, locale: locale).toJson());
      return AuthTokenResponse.fromJson(response.data);
    } on DioException catch (e) { throw ErrorMapper.mapDioError(e); }
  }
  
  Future<AuthTokenResponse> refreshToken(String refreshToken) async {
    if (Env.mockMode) return _mockRefreshToken();
    try {
      final response = await _dio.post(Endpoints.authRefresh, data: RefreshTokenRequest(refreshToken: refreshToken).toJson());
      return AuthTokenResponse.fromJson(response.data);
    } on DioException catch (e) { throw ErrorMapper.mapDioError(e); }
  }
  
  AuthTokenResponse _mockAnonymousAuth() {
    final mockPayload = _createMockJwt();
    return AuthTokenResponse(accessToken: mockPayload, refreshToken: 'mock_refresh_token_${DateTime.now().millisecondsSinceEpoch}');
  }
  
  AuthTokenResponse _mockRefreshToken() {
    final mockPayload = _createMockJwt();
    return AuthTokenResponse(accessToken: mockPayload, refreshToken: 'mock_refresh_token_${DateTime.now().millisecondsSinceEpoch}');
  }
  
  String _createMockJwt() {
    final exp = (DateTime.now().add(const Duration(hours: 24)).millisecondsSinceEpoch / 1000).round();
    const header = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';
    final payloadJson = '{"sub":"mock_user","exp":$exp}';
    final payload = base64Url.encode(utf8.encode(payloadJson)).replaceAll('=', '');
    return '$header.$payload.mock_signature';
  }
}
