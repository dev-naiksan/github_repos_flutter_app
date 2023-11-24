import 'package:github_flutter_app/data/repository/base_repository.dart';
import 'package:github_flutter_app/model/repo_model.dart';

abstract class RepoRepository extends BaseRepository {
  Future<RepositoryResult<List<Repo>>> fetchRepos(int page);
}
