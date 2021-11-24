import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter_app/ui/auth/auth_screen.dart';
import 'package:local_auth/local_auth.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _authFailed = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 1));
      _authenticate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
          visible: _authFailed,
          child: TextButton(
            child: Text("Retry"),
            onPressed: () {
              _authenticate();
            },
          ),
        ),
      ),
    );
  }

  void _authenticate() async {
    final authenticated = await _authenticateWithBiometrics();
    if (authenticated) {
      _navigate();
    } else {
      setState(() {
        _authFailed = true;
      });
    }
  }

  Future<bool> _authenticateWithBiometrics() async {
    try {
      return await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  void _navigate() async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AuthScreen.routeName, (Route<dynamic> route) => false);
  }
}
