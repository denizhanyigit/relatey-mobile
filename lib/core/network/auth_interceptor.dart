import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../errors/exceptions.dart';

const _accessTokenKey = 'relatey_access_token';
const _refreshTokenKey = 'relatey_refresh_token';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required FlutterSecureStorage storage,
    required Future<void> Function() onRefreshFailed,
  })  : _storage = storage,
        _onRefreshFailed = onRefreshFailed;
  
  final FlutterSecureStorage _storage;
  final Future<void> Function() _onRefreshFailed;
  bool _isRefreshing = false;
  
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains('/auth/anonymous')) return handler.next(options);
    
    final accessToken = await _storage.read(key: _accessTokenKey);
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }
  
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) return handler.next(err);
    if (_isRefreshing) return handler.next(err);
    if (err.requestOptions.path.contains('/auth/')) return handler.next(err);
    
    _isRefreshing = true;
    
    try {
      await _onRefreshFailed();
      final accessToken = await _storage.read(key: _accessTokenKey);
      if (accessToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        final dio = Dio();
        final response = await dio.fetch(err.requestOptions);
        _isRefreshing = false;
        return handler.resolve(response);
      }
      _isRefreshing = false;
      handler.reject(err);
    } catch (e) {
      _isRefreshing = false;
      handler.reject(DioException(
        requestOptions: err.requestOptions,
        error: const AuthException('Token yenileme başarısız'),
      ));
    }
  }
}

class TokenStorage {
  const TokenStorage(this._storage);
  final FlutterSecureStorage _storage;
  
  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);
  
  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }
  
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }
  
  Future<bool> hasTokens() async {
    final token = await _storage.read(key: _accessTokenKey);
    return token != null;
  }
}
