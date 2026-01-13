import 'package:drift/drift.dart';

class Decisions extends Table {
  TextColumn get id => text()();
  TextColumn get situationType => text()();
  TextColumn get contextText => text()();
  TextColumn get personLabel => text().nullable()();
  TextColumn get summaryText => text()();
  TextColumn get detailedText => text().nullable()();
  IntColumn get createdAt => integer()();
  
  @override
  Set<Column> get primaryKey => {id};
}
