import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:github_flutter_app/route/route_generator.dart';
import 'app_model.dart';
import 'ui/splash/splash_screen.dart';
import 'values/colors.dart';
import 'widgets/flavor_banner.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        final textTheme = GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
          initialRoute: SplashScreen.routeName,
          theme: ThemeData(
            primarySwatch: AppColor.PRIMARY_SWATCH,
            hintColor: AppColor.TEXT_HINT_COLOR,
            splashColor: AppColor.SPLASH_RIPPLE_COLOR.withOpacity(0.2),
            highlightColor: AppColor.SPLASH_RIPPLE_COLOR.withOpacity(0.2),
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: AppColor.ICON),
            textTheme: textTheme,
            appBarTheme: AppBarTheme(),
            tabBarTheme: TabBarTheme(
              labelStyle: textTheme.subtitle2,
              unselectedLabelStyle: textTheme.subtitle2,
            ),
          ),
          builder: (context, child) => FutureBuilder(
            future: GetIt.I.allReady(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return FlavorBanner(
                child: GestureDetector(
                  child: child,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.paused) {}
  }
}
