import 'package:github_flutter_app/data/mappers/repo_mapper.dart';
import 'package:github_flutter_app/data/network/dto/repo_dto.dart';
import 'package:github_flutter_app/model/repo_model.dart';

import 'repo_repository.dart';

class RepoRepositoryImpl extends RepoRepository {
  @override
  Stream<List<Repo>> get repoStream => dbClient.repoDao.repoStream.map(
      (event) => event.map((data) => RepoMapper.entityToModel(data)).toList());

  @override
  Future<List<Repo>> fetchRepos(int page) async {
    final response = await apiClient.getRepos({'page': page, 'per_page': 15});
    final list = response.data as List;
    if(page == 1){
      await dbClient.repoDao.deleteAll();
    }
    dbClient.repoDao
        .insertAll(list.map((e) => RepoMapper.dtoToEntity(RepoDto.fromJson(e))).toList());
    final repos = list.map((e) => RepoMapper.dtoToModel(RepoDto.fromJson(e))).toList();
    return repos;
  }
}
