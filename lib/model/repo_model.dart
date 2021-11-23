import 'base_model.dart';

class Repo extends ListModel {
  final int id;
  final String name;
  final String description;
  final int issues;
  final int watchers;
  final String language;

  Repo(
    this.id,
    this.name,
    this.description,
    this.issues,
    this.watchers,
    this.language,
  );
}
