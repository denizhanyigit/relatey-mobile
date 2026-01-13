import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/design/theme.dart';
import '../core/design/tokens/colors.dart';
import '../core/design/tokens/typography.dart';
import '../core/di/providers.dart';
import '../core/network/dio_provider.dart';
import '../features/auth/presentation/auth_controller.dart';
import 'bootstrap.dart';
import 'router.dart';

/// Main app widget.
class RelateyApp extends ConsumerStatefulWidget {
  const RelateyApp({super.key});
  
  @override
  ConsumerState<RelateyApp> createState() => _RelateyAppState();
}

class _RelateyAppState extends ConsumerState<RelateyApp> {
  bool _isInitialized = false;
  late final Dio _dio;
  
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }
  
  Future<void> _initializeApp() async {
    const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
    
    _dio = createDio(
      storage: storage,
      onRefreshFailed: () async {
        final authController = ref.read(authControllerProvider.notifier);
        await authController.reauthenticate();
      },
    );
    
    setState(() => _isInitialized = true);
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _ensureAuthAndLoadEntitlements();
    });
  }
  
  Future<void> _ensureAuthAndLoadEntitlements() async {
    final authController = ref.read(authControllerProvider.notifier);
    await authController.initialize();
    
    final entitlementsController = ref.read(
      entitlementsControllerProvider.notifier,
    );
    await entitlementsController.loadFromCache();
  }
  
  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: RelateyTheme.light,
        home: const _SplashScreen(),
      );
    }
    
    return ProviderScope(
      overrides: [
        dioProvider.overrideWithValue(_dio),
        databaseProvider.overrideWithValue(appDatabase),
      ],
      child: Consumer(
        builder: (context, ref, _) {
          final router = ref.watch(routerProvider);
          final authState = ref.watch(authControllerProvider);
          
          if (authState == AuthState.initial ||
              authState == AuthState.authenticating) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: RelateyTheme.light,
              home: const _SplashScreen(),
            );
          }
          
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Relatey',
            theme: RelateyTheme.light,
            routerConfig: router,
          );
        },
      ),
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
