sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
  @override
  String toString() => message;
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error']);
}

final class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});
  final int? statusCode;
}

final class AuthException extends AppException {
  const AuthException([super.message = 'Auth failed']);
}

final class PaywallRequiredException extends AppException {
  const PaywallRequiredException({
    this.reason = 'PAYWALL_REQUIRED',
    this.decisionId,
    this.action,
  }) : super('Paywall required');
  final String reason;
  final String? decisionId;
  final String? action;
}

final class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found']);
}

final class ParseException extends AppException {
  const ParseException([super.message = 'Parse error']);
}
