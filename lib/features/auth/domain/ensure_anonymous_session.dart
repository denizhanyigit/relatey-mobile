import '../../../core/utils/device_id.dart';
import 'auth_repository.dart';

class EnsureAnonymousSession {
  EnsureAnonymousSession({required AuthRepository authRepository, required DeviceIdManager deviceIdManager}) : _authRepository = authRepository, _deviceIdManager = deviceIdManager;
  final AuthRepository _authRepository;
  final DeviceIdManager _deviceIdManager;
  
  Future<bool> call() async {
    try {
      final hasValidTokens = await _authRepository.hasValidTokens();
      if (hasValidTokens) return true;
      final deviceId = await _deviceIdManager.getDeviceId();
      await _authRepository.authenticateAnonymous(deviceId: deviceId, locale: 'tr');
      return true;
    } catch (e) {
      assert(() { print('EnsureAnonymousSession failed: $e'); return true; }());
      return false;
    }
  }
  
  Future<bool> forceReauthenticate() async {
    try {
      await _authRepository.clearTokens();
      final deviceId = await _deviceIdManager.getDeviceId();
      await _authRepository.authenticateAnonymous(deviceId: deviceId, locale: 'tr');
      return true;
    } catch (e) {
      assert(() { print('Force reauthentication failed: $e'); return true; }());
      return false;
    }
  }
}
