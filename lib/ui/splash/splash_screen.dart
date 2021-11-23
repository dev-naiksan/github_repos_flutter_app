import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:github_flutter_app/ui/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 2));
      _navigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Splash'),
          onPressed: () {},
        ),
      ),
    );
  }

  void _navigate() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AuthScreen.routeName, (Route<dynamic> route) => false);
  }
}
