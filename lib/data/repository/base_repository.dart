import 'package:get_it/get_it.dart';
import 'package:github_flutter_app/data/db/db_client.dart';
import 'package:github_flutter_app/data/network/api_client.dart';
import 'package:github_flutter_app/data/preference/app_preferences.dart';

abstract class BaseRepository {
  final ApiClient apiClient = GetIt.I.get<ApiClient>();
  final DbClient dbClient = GetIt.I.get<DbClient>();
  final AppPreferences appPreferences = GetIt.I.get<AppPreferences>();
}
