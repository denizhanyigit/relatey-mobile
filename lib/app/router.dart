import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/di/providers.dart';
import '../core/network/dio_provider.dart';
import '../features/auth/data/auth_api.dart';
import '../features/auth/data/auth_repository_impl.dart';
import '../features/auth/domain/auth_repository.dart';
import '../features/auth/domain/ensure_anonymous_session.dart';
import '../features/auth/presentation/auth_controller.dart';
import '../features/decisions/data/decisions_api.dart';
import '../features/decisions/data/decisions_repository_impl.dart';
import '../features/decisions/domain/create_decision.dart';
import '../features/decisions/domain/decisions_repository.dart';
import '../features/decisions/presentation/context_screen.dart';
import '../features/decisions/presentation/decisions_controller.dart';
import '../features/decisions/presentation/home_screen.dart';
import '../features/decisions/presentation/summary_screen.dart';
import '../features/entitlements/data/entitlements_api.dart';
import '../features/entitlements/data/entitlements_repository_impl.dart';
import '../features/entitlements/domain/entitlements_repository.dart';
import '../features/entitlements/presentation/entitlements_controller.dart';
import '../features/paywall/presentation/paywall_screen.dart';

// ============ Auth Providers ============

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApi(dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(authApiProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepositoryImpl(api: api, tokenStorage: tokenStorage);
});

final ensureAnonymousSessionProvider = Provider<EnsureAnonymousSession>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final deviceIdManager = ref.watch(deviceIdManagerProvider);
  return EnsureAnonymousSession(
    authRepository: authRepository,
    deviceIdManager: deviceIdManager,
  );
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  final ensureAnonymousSession = ref.watch(ensureAnonymousSessionProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(
    ensureAnonymousSession: ensureAnonymousSession,
    authRepository: authRepository,
  );
});

// ============ Entitlements Providers ============

final entitlementsApiProvider = Provider<EntitlementsApi>((ref) {
  final dio = ref.watch(dioProvider);
  return EntitlementsApi(dio);
});

final entitlementsRepositoryProvider = Provider<EntitlementsRepository>((ref) {
  final api = ref.watch(entitlementsApiProvider);
  final database = ref.watch(databaseProvider);
  return EntitlementsRepositoryImpl(api: api, database: database);
});

final entitlementsControllerProvider =
    StateNotifierProvider<EntitlementsController, EntitlementsState>((ref) {
  final repository = ref.watch(entitlementsRepositoryProvider);
  return EntitlementsController(repository: repository);
});

// ============ Decisions Providers ============

final decisionsApiProvider = Provider<DecisionsApi>((ref) {
  final dio = ref.watch(dioProvider);
  return DecisionsApi(dio);
});

final decisionsRepositoryProvider = Provider<DecisionsRepository>((ref) {
  final api = ref.watch(decisionsApiProvider);
  final database = ref.watch(databaseProvider);
  return DecisionsRepositoryImpl(api: api, database: database);
});

final createDecisionProvider = Provider<CreateDecision>((ref) {
  final repository = ref.watch(decisionsRepositoryProvider);
  return CreateDecision(repository: repository);
});

final createDecisionControllerProvider =
    StateNotifierProvider<CreateDecisionController, CreateDecisionState>((ref) {
  final createDecision = ref.watch(createDecisionProvider);
  return CreateDecisionController(createDecision: createDecision);
});

final decisionViewControllerProvider = StateNotifierProvider.family<
    DecisionViewController, DecisionViewState, String>((ref, decisionId) {
  final repository = ref.watch(decisionsRepositoryProvider);
  return DecisionViewController(
    repository: repository,
    decisionId: decisionId,
  );
});

// ============ Router ============

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);
  
  return GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (authState == AuthState.failed) {
        return null;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/decision/context',
        name: 'context',
        builder: (context, state) {
          final situationType = state.extra as String? ?? 'should_message';
          return ContextScreen(situationType: situationType);
        },
      ),
      GoRoute(
        path: '/decision/:id/summary',
        name: 'summary',
        builder: (context, state) {
          final decisionId = state.pathParameters['id']!;
          return SummaryScreen(decisionId: decisionId);
        },
      ),
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        builder: (context, state) {
          final queryParams = state.uri.queryParameters;
          return PaywallScreen(
            reason: queryParams['reason'],
            decisionId: queryParams['decisionId'],
            action: queryParams['action'],
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Sayfa bulunamadı: ${state.uri.path}'),
      ),
    ),
  );
});
