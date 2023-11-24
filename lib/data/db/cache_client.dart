import 'dart:core';

import 'package:github_flutter_app/data/db/tables/repo.dart';
import 'package:github_flutter_app/data/mappers/repo_mapper.dart';
import 'package:hive_flutter/adapters.dart';

import '../../model/repo_model.dart';

class CacheClient {
  static late Box<RepoEntity> _repoBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RepoEntityAdapter());
    _repoBox = await Hive.openBox('repos');
  }

  static Future<Iterable<int>> saveRepos(List<RepoEntity> repos) async {
    return await _repoBox.addAll(repos);
  }

  static Future<List<RepoEntity>> getRepos() async {
    return _repoBox.values.toList();
  }

  static Future<void> dispose() async {
    return _repoBox.close();
  }

  static Future<int> deleteAll() {
    return _repoBox.clear();
  }
}
