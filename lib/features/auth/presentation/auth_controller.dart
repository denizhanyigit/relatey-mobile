import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/auth_repository.dart';
import '../domain/ensure_anonymous_session.dart';

enum AuthState { initial, authenticating, authenticated, failed }

class AuthController extends StateNotifier<AuthState> {
  AuthController({required EnsureAnonymousSession ensureAnonymousSession, required AuthRepository authRepository}) : _ensureAnonymousSession = ensureAnonymousSession, _authRepository = authRepository, super(AuthState.initial);
  final EnsureAnonymousSession _ensureAnonymousSession;
  final AuthRepository _authRepository;
  
  Future<void> initialize() async {
    if (state == AuthState.authenticating) return;
    state = AuthState.authenticating;
    final success = await _ensureAnonymousSession();
    state = success ? AuthState.authenticated : AuthState.failed;
  }
  
  Future<void> reauthenticate() async {
    state = AuthState.authenticating;
    final success = await _ensureAnonymousSession.forceReauthenticate();
    state = success ? AuthState.authenticated : AuthState.failed;
  }
  
  bool get isAuthenticated => state == AuthState.authenticated;
  Future<String?> getAccessToken() => _authRepository.getAccessToken();
}
