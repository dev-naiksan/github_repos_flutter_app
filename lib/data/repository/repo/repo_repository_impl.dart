import 'package:connectivity/connectivity.dart';
import 'package:github_flutter_app/data/mappers/repo_mapper.dart';
import 'package:github_flutter_app/data/network/dto/repo_dto.dart';
import 'package:github_flutter_app/model/repo_model.dart';

import '../base_repository.dart';
import 'repo_repository.dart';

class RepoRepositoryImpl extends RepoRepository {
  @override
  Stream<List<Repo>> get repoStream => dbClient.repoDao.repoStream.map(
      (event) => event.map((data) => RepoMapper.entityToModel(data)).toList());

  @override
  Future<RepositoryResult<List<Repo>>> fetchRepos(int page) async {
    final limit = 15;
    final connectivity = await Connectivity().checkConnectivity();

    //Fetch from db
    if (connectivity == ConnectivityResult.none) {
      final list = await dbClient.repoDao.getRepos(page, limit).then(
          (value) => value.map((e) => RepoMapper.entityToModel(e)).toList());
      await Future.delayed(Duration(seconds: 1));
      return RepositoryResult(list, RepositoryResultSource.cached);
    }

    //Fetch from network
    final response =
        await apiClient.getRepos({'page': page, 'per_page': limit});

    final list = response.data as List;
    if (page == 1) {
      await dbClient.repoDao.deleteAll();
    }
    dbClient.repoDao.insertAll(
        list.map((e) => RepoMapper.dtoToEntity(RepoDto.fromJson(e))).toList());
    final repos =
        list.map((e) => RepoMapper.dtoToModel(RepoDto.fromJson(e))).toList();
    return RepositoryResult(repos, RepositoryResultSource.server);
  }
}
