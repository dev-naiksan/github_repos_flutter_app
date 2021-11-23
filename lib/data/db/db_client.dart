import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_flutter_app/data/db/tables/repo.dart';
import 'package:path_provider/path_provider.dart';

import 'daos/repo_dao.dart';
import 'package:path/path.dart' as p;

part 'db_client.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [RepoEntity], daos: [RepoDao])
class DbClient extends _$DbClient {
  DbClient() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          debugPrint('MigrationStrategy: onUpgrade: from: $from: to: $to');

          if (from <= 1) {
            // await m.addColumn(userEntity, userEntity.fieldName);
          }
        },
      );
}
