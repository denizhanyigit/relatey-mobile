import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

abstract final class ErrorMapper {
  static AppException mapDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkException('Bağlantı zaman aşımı');
      case DioExceptionType.badResponse:
        return _mapResponseError(error.response);
      case DioExceptionType.cancel:
        return const NetworkException('İstek iptal edildi');
      case DioExceptionType.badCertificate:
        return const NetworkException('Sertifika hatası');
      case DioExceptionType.unknown:
        return const NetworkException();
    }
  }
  
  static AppException _mapResponseError(Response? response) {
    if (response == null) return const ServerException('Yanıt yok');
    
    final statusCode = response.statusCode ?? 500;
    final data = response.data;
    
    if (statusCode == 403 && data is Map<String, dynamic>) {
      final error = data['error'] as String?;
      if (error == 'PAYWALL_REQUIRED') {
        return PaywallRequiredException(
          reason: error!,
          decisionId: data['decisionId'] as String?,
          action: data['action'] as String?,
        );
      }
    }
    
    return switch (statusCode) {
      400 => ServerException(_extractMessage(data) ?? 'Geçersiz istek', statusCode: statusCode),
      401 => const AuthException('Oturum süresi doldu'),
      403 => ServerException(_extractMessage(data) ?? 'Erişim reddedildi', statusCode: statusCode),
      404 => const NotFoundException(),
      >= 500 => ServerException('Sunucu hatası', statusCode: statusCode),
      _ => ServerException(_extractMessage(data) ?? 'Beklenmeyen hata', statusCode: statusCode),
    };
  }
  
  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? data['error'] as String?;
    }
    return null;
  }
}
