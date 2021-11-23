import 'package:drift/drift.dart';
import 'package:github_flutter_app/data/db/tables/repo.dart';

import '../db_client.dart';

part 'repo_dao.g.dart';

@DriftAccessor(tables: [RepoEntity])
class RepoDao extends DatabaseAccessor<DbClient> with _$RepoDaoMixin {
  RepoDao(DbClient db) : super(db);

  Future deleteAll() async {
    await delete(repoEntity).go();
  }

  Future insertAll(List<RepoEntityData> data) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(repoEntity, data);
    });
  }

  Stream<List<RepoEntityData>> get repoStream {
    return (select(repoEntity)
          ..orderBy([(t) => OrderingTerm(expression: t.name.lower(), mode: OrderingMode.asc)]))
        .watch();
  }
}
