import 'package:flutter/material.dart';
import 'package:github_flutter_app/ui/auth/auth_screen.dart';
import 'package:github_flutter_app/ui/auth/auth_vm.dart';
import 'package:github_flutter_app/ui/repos/repo_screen.dart';
import 'package:github_flutter_app/ui/repos/repo_vm.dart';
import 'package:github_flutter_app/ui/splash/splash_screen.dart';
import 'package:github_flutter_app/ui/splash/splash_vm.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<SplashVM>(
                  create: (_) => SplashVM(),
                  child: SplashScreen(),
                ));
      case AuthScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<AuthVM>(
                  create: (_) => AuthVM(),
                  child: AuthScreen(),
                ));
      case RepoScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<RepoVM>(
                  create: (_) => RepoVM(),
                  child: RepoScreen(),
                ));
      default:
        print('Navigating to ${settings.name}');
        return buildErrorRoute();
    }
  }

  static Route<dynamic> buildErrorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Arggg!'),
          ),
          body: Center(
            child: Text('Oh No! You should not be here! '),
          ),
        );
      },
    );
  }
}
