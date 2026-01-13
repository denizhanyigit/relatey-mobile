/// Environment configuration for Relatey app.
abstract final class Env {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000',
  );
  
  static const bool mockMode = bool.fromEnvironment(
    'MOCK_MODE',
    defaultValue: true,
  );
  
  static const bool isDebug = bool.fromEnvironment(
    'DEBUG',
    defaultValue: true,
  );
}
