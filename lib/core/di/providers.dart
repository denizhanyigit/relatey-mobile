import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/auth_interceptor.dart';
import '../network/dio_provider.dart';
import '../storage/db.dart';
import '../utils/device_id.dart';
import '../../features/auth/data/auth_api.dart';
import '../../features/auth/data/auth_repository_impl.dart';
import '../../features/auth/domain/auth_repository.dart';
import '../../features/auth/domain/ensure_anonymous_session.dart';
import '../../features/auth/presentation/auth_controller.dart';
import '../../features/decisions/data/decisions_api.dart';
import '../../features/decisions/data/decisions_repository_impl.dart';
import '../../features/decisions/domain/create_decision.dart';
import '../../features/decisions/domain/decisions_repository.dart';
import '../../features/decisions/presentation/decisions_controller.dart';
import '../../features/entitlements/data/entitlements_api.dart';
import '../../features/entitlements/data/entitlements_repository_impl.dart';
import '../../features/entitlements/domain/entitlements_repository.dart';
import '../../features/entitlements/presentation/entitlements_controller.dart';

// ============ Core Infrastructure Providers ============

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Database must be overridden in bootstrap');
});

final deviceIdManagerProvider = Provider<DeviceIdManager>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return DeviceIdManager(storage);
});

final storageProvider = Provider<FlutterSecureStorage>((ref) {
  return ref.watch(secureStorageProvider);
});

final globalTokenStorageProvider = Provider<TokenStorage>((ref) {
  return ref.watch(tokenStorageProvider);
});

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

final entitlementsRepositoryProvider = Provider<EntitlementsRepository>(
  (ref) {
    final api = ref.watch(entitlementsApiProvider);
    final database = ref.watch(databaseProvider);
    return EntitlementsRepositoryImpl(api: api, database: database);
  },
  dependencies: [databaseProvider],
);

final entitlementsControllerProvider =
    StateNotifierProvider<EntitlementsController, EntitlementsState>(
  (ref) {
    final repository = ref.watch(entitlementsRepositoryProvider);
    return EntitlementsController(repository: repository);
  },
  dependencies: [entitlementsRepositoryProvider],
);

// ============ Decisions Providers ============

final decisionsApiProvider = Provider<DecisionsApi>((ref) {
  final dio = ref.watch(dioProvider);
  return DecisionsApi(dio);
});

final decisionsRepositoryProvider = Provider<DecisionsRepository>(
  (ref) {
    final api = ref.watch(decisionsApiProvider);
    final database = ref.watch(databaseProvider);
    return DecisionsRepositoryImpl(api: api, database: database);
  },
  dependencies: [databaseProvider],
);

final createDecisionProvider = Provider<CreateDecision>(
  (ref) {
    final repository = ref.watch(decisionsRepositoryProvider);
    return CreateDecision(repository: repository);
  },
  dependencies: [decisionsRepositoryProvider],
);

final createDecisionControllerProvider =
    StateNotifierProvider<CreateDecisionController, CreateDecisionState>(
  (ref) {
    final createDecision = ref.watch(createDecisionProvider);
    return CreateDecisionController(createDecision: createDecision);
  },
  dependencies: [createDecisionProvider],
);

final decisionViewControllerProvider = StateNotifierProvider.family<
    DecisionViewController, DecisionViewState, String>(
  (ref, decisionId) {
    final repository = ref.watch(decisionsRepositoryProvider);
    return DecisionViewController(
      repository: repository,
      decisionId: decisionId,
    );
  },
  dependencies: [decisionsRepositoryProvider],
);
