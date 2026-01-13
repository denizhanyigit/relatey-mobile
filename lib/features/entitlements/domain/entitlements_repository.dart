import 'entitlements_models.dart';

abstract class EntitlementsRepository {
  Future<Entitlements> fetchEntitlements();
  Future<Entitlements?> getCachedEntitlements();
  Stream<Entitlements?> getEntitlementsStream();
  Future<void> updateCache(Entitlements entitlements);
  /// DEV ONLY: Simulate credit addition for testing.
  Future<void> addCredits(int amount);
}
