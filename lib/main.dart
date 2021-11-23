import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:github_flutter_app/data/repository/auth/auth_repository.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'app_model.dart';
import 'data/db/db_client.dart';
import 'data/network/api_client.dart';
import 'data/preference/app_preferences.dart';
import 'data/repository/auth/auth_repository_impl.dart';
import 'data/repository/repo/repo_repository.dart';
import 'data/repository/repo/repo_repository_impl.dart';
import 'flavor_config.dart';

Future<void> runMain(Flavor flavor) async {
  GetIt.I.registerSingleton<FlavorConfig>(FlavorConfig(flavor: flavor));
  GetIt.I.registerSingletonAsync<AppPreferences>(
      () => AppPreferences.getInstance());
  GetIt.I.registerSingleton<DbClient>(DbClient());
  GetIt.I.registerSingleton<ApiClient>(ApiClient());

  GetIt.I.registerSingletonWithDependencies<AuthRepository>(
      () => AuthRepositoryImpl(),
      dependsOn: [AppPreferences]);

  GetIt.I.registerSingletonWithDependencies<RepoRepository>(
      () => RepoRepositoryImpl(),
      dependsOn: [AppPreferences]);

  GetIt.I.registerSingletonWithDependencies<AppModel>(
    () => AppModel(),
    dependsOn: [AppPreferences],
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    await GetIt.I.allReady();
    runApp(
      ChangeNotifierProvider<AppModel>.value(
        value: GetIt.I.get<AppModel>(),
        child: App(),
      ),
    );
  });
}
