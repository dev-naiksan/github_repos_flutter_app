import 'package:drift/drift.dart';

class RepoEntity extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  IntColumn get issues => integer()();

  IntColumn get watchers => integer()();

  TextColumn get language => text()();

  @override
  Set<Column> get primaryKey => {id};
}
