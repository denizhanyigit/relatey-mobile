import 'package:dio/dio.dart';
import '../../../core/config/endpoints.dart';
import '../../../core/config/env.dart';
import '../../../core/network/error_mapper.dart';
import '../domain/entitlements_models.dart';

class EntitlementsApi {
  EntitlementsApi(this._dio);
  final Dio _dio;
  
  Future<EntitlementsResponse> fetchEntitlements() async {
    if (Env.mockMode) return _mockFetchEntitlements();
    try {
      final response = await _dio.get(Endpoints.entitlements);
      return EntitlementsResponse.fromJson(response.data);
    } on DioException catch (e) { throw ErrorMapper.mapDioError(e); }
  }
  
  EntitlementsResponse _mockFetchEntitlements() => const EntitlementsResponse(hasPro: false, credits: 0, expiresAt: null);
}
