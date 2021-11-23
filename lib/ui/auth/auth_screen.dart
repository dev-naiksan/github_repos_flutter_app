import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter_app/ui/base/base_result.dart';
import 'package:github_flutter_app/ui/repos/repo_screen.dart';
import 'package:github_flutter_app/utils/functions.dart';
import 'package:github_flutter_app/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import 'auth_vm.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = 'auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = "user1@gmail.com";
    _passwordController.text = "user#12;";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(
      builder: (__, model, _) => Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Password'),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24),
                PrimaryButton(
                  title: 'SUBMIT',
                  isLoading: model.loading,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    final model = Provider.of<AuthVM>(context, listen: false);
    final result =
        await model.login(_emailController.text, _passwordController.text);
    if (result is UiSuccess) {
      _navigateToDashboard();
    } else if (result is UiFailure) {
      showErrorFlushbar(context: context, message: result.message);
    }
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RepoScreen.routeName, (Route<dynamic> route) => false);
  }
}
