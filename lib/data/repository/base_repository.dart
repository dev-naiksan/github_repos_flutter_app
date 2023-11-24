import 'package:github_flutter_app/data/db/cache_client.dart';
import 'package:github_flutter_app/data/network/api_client.dart';
import 'package:github_flutter_app/data/preference/app_preferences.dart';

abstract class BaseRepository {
  final ApiClient apiClient = ApiClient();

  Future<AppPreferences> get appPreferences => AppPreferences.getInstance();
}

enum RepositoryResultSource { server, cached }

class RepositoryResult<T> {
  final T data;
  final RepositoryResultSource source;

  RepositoryResult(this.data, this.source);
}
