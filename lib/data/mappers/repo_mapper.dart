import 'package:github_flutter_app/data/network/dto/repo_dto.dart';
import 'package:github_flutter_app/model/repo_model.dart';

import '../db/tables/repo.dart';

class RepoMapper {
  static Repo entityToModel(RepoEntity data) {
    return Repo(
      data.id,
      data.name,
      data.description,
      data.issues,
      data.watchers,
      data.language,
    );
  }

  static RepoEntity modelToEntity(Repo model) {
    return RepoEntity(
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

  static RepoEntity dtoToEntity(RepoDto dto) {
    return RepoEntity(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      issues: dto.issues,
      watchers: dto.watchers,
      language: dto.language,
    );
  }
}
