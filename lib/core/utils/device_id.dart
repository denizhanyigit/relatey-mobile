import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _deviceIdKey = 'relatey_device_id';

/// Generates and stores a stable device ID.
class DeviceIdManager {
  DeviceIdManager(this._storage);
  
  final FlutterSecureStorage _storage;
  String? _cachedDeviceId;
  
  /// Gets or creates a stable device ID.
  Future<String> getDeviceId() async {
    if (_cachedDeviceId != null) return _cachedDeviceId!;
    
    final storedId = await _storage.read(key: _deviceIdKey);
    if (storedId != null) {
      _cachedDeviceId = storedId;
      return storedId;
    }
    
    final newId = _generateUuid();
    await _storage.write(key: _deviceIdKey, value: newId);
    _cachedDeviceId = newId;
    return newId;
  }
  
  String _generateUuid() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    return _bytesToUuid(bytes);
  }
  
  String _bytesToUuid(List<int> bytes) {
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
  }
}
