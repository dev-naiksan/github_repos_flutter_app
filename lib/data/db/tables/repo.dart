
import 'package:hive/hive.dart';
part 'repo.g.dart';

const int _repoEntityId = 1;

@HiveType(typeId: _repoEntityId)
class RepoEntity {
  RepoEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.issues,
    required this.watchers,
    required this.language,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  int issues;
  @HiveField(4)
  int watchers;
  @HiveField(5)
  String language;
}
