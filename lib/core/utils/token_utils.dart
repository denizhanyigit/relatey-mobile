import 'dart:convert';

/// Utility functions for JWT token handling.
abstract final class TokenUtils {
  /// Checks if a JWT token is expired.
  static bool isTokenExpired(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return true;
      
      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));
      final Map<String, dynamic> claims = json.decode(decoded);
      
      final exp = claims['exp'] as int?;
      if (exp == null) return true;
      
      final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      return DateTime.now().isAfter(expiryDate.subtract(const Duration(seconds: 30)));
    } catch (_) {
      return true;
    }
  }
}
