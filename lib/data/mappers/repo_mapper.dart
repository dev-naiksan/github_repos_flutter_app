import 'package:github_flutter_app/data/db/db_client.dart';
import 'package:github_flutter_app/data/network/dto/repo_dto.dart';
import 'package:github_flutter_app/model/repo_model.dart';

class RepoMapper {
  static Repo entityToModel(RepoEntityData data) {
    return Repo(
      data.id,
      data.name,
      data.description,
      data.issues,
      data.watchers,
      data.language,
    );
  }

  static RepoEntityData modelToEntity(Repo model) {
    return RepoEntityData(
      id: model.id,
      name: model.name,
      description: model.description,
      issues: model.issues,
      watchers: model.watchers,
      language: model.language,
    );
  }

  static Repo dtoToModel(RepoDto dto) {
    return Repo(
      dto.id,
      dto.name,
      dto.description,
      dto.issues,
      dto.watchers,
      dto.language,
    );
  }

  static RepoEntityData dtoToEntity(RepoDto dto) {
    return RepoEntityData(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      issues: dto.issues,
      watchers: dto.watchers,
      language: dto.language,
    );
  }
}
