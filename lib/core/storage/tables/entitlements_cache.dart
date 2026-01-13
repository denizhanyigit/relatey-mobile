import 'package:drift/drift.dart';

class EntitlementsCache extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get hasPro => boolean().withDefault(const Constant(false))();
  IntColumn get credits => integer().withDefault(const Constant(0))();
  IntColumn get expiresAt => integer().nullable()();
  IntColumn get updatedAt => integer()();
  
  @override
  Set<Column> get primaryKey => {id};
}
