import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables/entitlements_cache.dart';
import 'tables/decisions.dart';

part 'db.g.dart';

@DriftDatabase(tables: [EntitlementsCache, Decisions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.e);
  
  @override
  int get schemaVersion => 1;
  
  Future<void> upsertEntitlementsCache({required bool hasPro, required int credits, int? expiresAt}) async {
    await into(entitlementsCache).insertOnConflictUpdate(
      EntitlementsCacheCompanion.insert(
        id: const Value(1),
        hasPro: Value(hasPro),
        credits: Value(credits),
        expiresAt: Value(expiresAt),
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
  
  Stream<EntitlementsCacheData?> getEntitlementsCacheStream() {
    return (select(entitlementsCache)..where((t) => t.id.equals(1))).watchSingleOrNull();
  }
  
  Future<EntitlementsCacheData?> getEntitlementsCache() {
    return (select(entitlementsCache)..where((t) => t.id.equals(1))).getSingleOrNull();
  }
  
  Future<void> upsertDecisionSummary({
    required String id,
    required String situationType,
    required String contextText,
    String? personLabel,
    required String summaryText,
  }) async {
    await into(decisions).insertOnConflictUpdate(
      DecisionsCompanion.insert(
        id: id,
        situationType: situationType,
        contextText: contextText,
        personLabel: Value(personLabel),
        summaryText: summaryText,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
  
  Future<void> updateDecisionDetailedText({required String id, required String detailedText}) async {
    await (update(decisions)..where((t) => t.id.equals(id))).write(
      DecisionsCompanion(detailedText: Value(detailedText)),
    );
  }
  
  Stream<Decision?> getDecisionByIdStream(String id) {
    return (select(decisions)..where((t) => t.id.equals(id))).watchSingleOrNull();
  }
  
  Future<Decision?> getDecisionById(String id) {
    return (select(decisions)..where((t) => t.id.equals(id))).getSingleOrNull();
  }
  
  Stream<List<Decision>> getAllDecisionsStream() {
    return (select(decisions)..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)])).watch();
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'relatey_db');
}
