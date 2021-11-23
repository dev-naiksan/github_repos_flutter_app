import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:github_flutter_app/values/colors.dart';

import '../../app_model.dart';
import 'base_vm.dart';

class ScreenScaffoldConsumer<T extends BaseVM> extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final Widget Function(BuildContext context, AppModel model, T value) builder;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomPadding;
  final List<Widget>? actions;
  final Widget? fab;

  const ScreenScaffoldConsumer({
    Key? key,
    required this.title,
    required this.builder,
    this.subtitle,
    this.extendBodyBehindAppBar = true,
    this.resizeToAvoidBottomPadding = true,
    this.actions,
    this.fab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (_, appModel, child) => Consumer<T>(
        builder: (_, model, child) => ScreenScaffold(
          title: title,
          subtitle: subtitle,
          body: builder(context, appModel, model),
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
          actions: actions,
          fab: fab,
        ),
      ),
    );
  }
}

class ScreenScaffold extends StatelessWidget {
  final GlobalKey? scaffoldKey;
  final String? title;
  final Widget? subtitle;
  final Widget? body;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomPadding;
  final List<Widget>? actions;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;

  const ScreenScaffold({
    Key? key,
    this.scaffoldKey,
    this.title,
    this.subtitle,
    this.body,
    this.extendBodyBehindAppBar = true,
    this.resizeToAvoidBottomPadding = true,
    this.actions,
    this.fab,
    this.fabLocation,
  }) : super(key: key);

  Widget? _buildTitle() {
    final list = <Widget>[];
    if (title == null && subtitle == null) return null;
    if (title != null) {
      list.add(Text(
        title!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.BLACK,
        ),
      ));
    }
    if (subtitle != null) {
      list.add(subtitle!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: resizeToAvoidBottomPadding,
      appBar: AppBar(
        backgroundColor: AppColor.WHITE,
        elevation: 0,
        title: _buildTitle(),
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : null,
        actions: actions,
      ),
      floatingActionButton: fab,
      floatingActionButtonLocation:
          fabLocation ?? FloatingActionButtonLocation.centerDocked,
      extendBodyBehindAppBar: false,
      body: body,
    );
  }
}
