import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/auth_interceptor.dart';
import '../network/dio_provider.dart';
import '../storage/db.dart';
import '../utils/device_id.dart';

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
