import 'entitlements_models.dart';

abstract class EntitlementsRepository {
  Future<Entitlements> fetchEntitlements();
  Future<Entitlements?> getCachedEntitlements();
  Stream<Entitlements?> getEntitlementsStream();
  Future<void> updateCache(Entitlements entitlements);
  Future<void> deductCredits(int amount);
  Future<void> addCredits(int amount);
}
