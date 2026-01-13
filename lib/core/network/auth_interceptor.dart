import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../errors/exceptions.dart';

const _accessTokenKey = 'relatey_access_token';
const _refreshTokenKey = 'relatey_refresh_token';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required FlutterSecureStorage storage,
    required Future<void> Function() onRefreshFailed,
    required Dio Function() dioGetter,
  })  : _storage = storage,
        _onRefreshFailed = onRefreshFailed,
        _dioGetter = dioGetter;

  final FlutterSecureStorage _storage;
  final Future<void> Function() _onRefreshFailed;
  final Dio Function() _dioGetter;

  Completer<void>? _refreshCompleter;

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

    // Auth-related requests should fail immediately on 401.
    if (err.requestOptions.path.contains('/auth/')) return handler.next(err);

    // Prevent retry loops: if this request already has a retry marker, fail.
    if (err.requestOptions.extra['_authRetried'] == true) {
      return handler.reject(DioException(
        requestOptions: err.requestOptions,
        error: const AuthException('Token yenileme başarısız'),
      ));
    }

    try {
      // If another request is already refreshing, wait for it.
      if (_refreshCompleter != null) {
        await _refreshCompleter!.future;
      } else {
        // Start refresh.
        _refreshCompleter = Completer<void>();
        try {
          await _onRefreshFailed();
          _refreshCompleter!.complete();
        } catch (e) {
          _refreshCompleter!.completeError(e);
          rethrow;
        } finally {
          _refreshCompleter = null;
        }
      }

      // After refresh, retry the failed request ONCE using the SAME Dio instance.
      final accessToken = await _storage.read(key: _accessTokenKey);
      if (accessToken == null) {
        return handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: const AuthException('Token yenileme başarısız'),
        ));
      }

      // Clone request options and mark as retried.
      final retryOptions = err.requestOptions;
      retryOptions.headers['Authorization'] = 'Bearer $accessToken';
      retryOptions.extra['_authRetried'] = true;

      // Use the same Dio instance for retry.
      final response = await _dioGetter().fetch(retryOptions);
      return handler.resolve(response);
    } catch (e) {
      // Clear tokens on refresh failure.
      await _storage.delete(key: _accessTokenKey);
      await _storage.delete(key: _refreshTokenKey);

      return handler.reject(DioException(
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
