import '../../../core/storage/db.dart';
import '../domain/entitlements_models.dart';
import '../domain/entitlements_repository.dart';
import 'entitlements_api.dart';

class EntitlementsRepositoryImpl implements EntitlementsRepository {
  EntitlementsRepositoryImpl({required EntitlementsApi api, required AppDatabase database}) : _api = api, _database = database;
  final EntitlementsApi _api;
  final AppDatabase _database;
  
  @override
  Future<Entitlements> fetchEntitlements() async {
    final response = await _api.fetchEntitlements();
    final entitlements = Entitlements(hasPro: response.hasPro, credits: response.credits, expiresAt: response.expiresAt, updatedAt: DateTime.now().millisecondsSinceEpoch);
    await updateCache(entitlements);
    return entitlements;
  }
  
  @override
  Future<Entitlements?> getCachedEntitlements() async {
    final cache = await _database.getEntitlementsCache();
    if (cache == null) return null;
    return Entitlements(hasPro: cache.hasPro, credits: cache.credits, expiresAt: cache.expiresAt, updatedAt: cache.updatedAt);
  }
  
  @override
  Stream<Entitlements?> getEntitlementsStream() {
    return _database.getEntitlementsCacheStream().map((cache) {
      if (cache == null) return null;
      return Entitlements(hasPro: cache.hasPro, credits: cache.credits, expiresAt: cache.expiresAt, updatedAt: cache.updatedAt);
    });
  }
  
  @override
  Future<void> updateCache(Entitlements entitlements) async {
    await _database.upsertEntitlementsCache(hasPro: entitlements.hasPro, credits: entitlements.credits, expiresAt: entitlements.expiresAt);
  }
  
  @override
  Future<void> deductCredits(int amount) async {
    final current = await getCachedEntitlements();
    if (current == null) return;
    final newCredits = (current.credits - amount).clamp(0, 999);
    await _database.upsertEntitlementsCache(hasPro: current.hasPro, credits: newCredits, expiresAt: current.expiresAt);
  }
  
  @override
  Future<void> addCredits(int amount) async {
    final current = await getCachedEntitlements();
    final currentCredits = current?.credits ?? 0;
    final hasPro = current?.hasPro ?? false;
    await _database.upsertEntitlementsCache(hasPro: hasPro, credits: currentCredits + amount, expiresAt: current?.expiresAt);
  }
}
