import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/decisions/presentation/context_screen.dart';
import '../features/decisions/presentation/home_screen.dart';
import '../features/decisions/presentation/share_situation_screen.dart';
import '../features/decisions/presentation/summary_screen.dart';
import '../features/paywall/presentation/paywall_screen.dart';
import '../features/welcome/presentation/welcome_screen.dart';

// ============ Router ============
// All providers are now in core/di/providers.dart

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
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
        path: '/decision/share',
        name: 'share-situation',
        builder: (context, state) {
          final situationType = state.extra as String? ?? 'should_message';
          return ShareSituationScreen(situationType: situationType);
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
