import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter_app/data/db/cache_client.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'app_model.dart';
import 'flavor_config.dart';

Future<void> runMain(Flavor flavor) async {
  FlavorConfig(flavor: flavor);
  await CacheClient.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    runApp(
      ChangeNotifierProvider<AppModel>.value(
        value: AppModel(),
        child: App(),
      ),
    );
  });
}
