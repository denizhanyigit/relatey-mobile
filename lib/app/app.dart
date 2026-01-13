import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/design/theme.dart';
import '../core/design/tokens/colors.dart';
import '../core/design/tokens/typography.dart';
import '../core/di/providers.dart';
import '../core/network/dio_provider.dart';
import '../features/auth/presentation/auth_controller.dart';
import 'bootstrap.dart';
import 'router.dart';

/// Main app widget.
class RelateyApp extends StatelessWidget {
  const RelateyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(appDatabase),
      ],
      child: const _RelateyAppContent(),
    );
  }
}

class _RelateyAppContent extends ConsumerStatefulWidget {
  const _RelateyAppContent();

  @override
  ConsumerState<_RelateyAppContent> createState() => _RelateyAppContentState();
}

class _RelateyAppContentState extends ConsumerState<_RelateyAppContent> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initialize());
  }

  Future<void> _initialize() async {
    // Set up auth refresh callback.
    ref.read(onAuthRefreshFailedProvider.notifier).state = () async {
      final authController = ref.read(authControllerProvider.notifier);
      await authController.reauthenticate();
    };

    final authController = ref.read(authControllerProvider.notifier);
    await authController.initialize();

    final entitlementsController = ref.read(entitlementsControllerProvider.notifier);
    await entitlementsController.loadFromCache();

    if (mounted) setState(() => _initialized = true);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    if (!_initialized ||
        authState == AuthState.initial ||
        authState == AuthState.authenticating) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: RelateyTheme.light,
        home: const _SplashScreen(),
      );
    }

    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Relatey',
      theme: RelateyTheme.light,
      routerConfig: router,
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RelateyColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Relatey',
              style: RelateyTypography.displayMedium.copyWith(
                color: RelateyColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Net kararlar için',
              style: RelateyTypography.bodyMedium.copyWith(
                color: RelateyColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  RelateyColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
