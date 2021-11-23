import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter_app/values/colors.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

void showErrorFlushbar({
  required BuildContext context,
  required String message,
}) {
  showFlushbar(
      context: context,
      title: message,
      backgroundColor: AppColor.RED,
      fontColor: AppColor.WHITE);
}

void showFlushbar({
  required BuildContext context,
  required String title,
  String? body,
  Color backgroundColor = AppColor.WHITE,
  Color fontColor = AppColor.BLACK,
  bool long = false,
  VoidCallback? onTapped,
}) {
  Flushbar(
    margin: EdgeInsets.all(8.0),
    onTap: (data) {
      onTapped?.call();
    },
    padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
    borderRadius: BorderRadius.all(Radius.circular(12)),
    flushbarPosition: FlushbarPosition.TOP,
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              color: fontColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Visibility(
            visible: body != null,
            child: Text(
              body ?? '',
              style: TextStyle(
                fontSize: 12.0,
                color: fontColor,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ],
      ),
    ),
    barBlur: 10,
    backgroundColor: backgroundColor,
    boxShadows: [
      BoxShadow(blurRadius: 8, color: AppColor.BLACK.withOpacity(0.2))
    ],
    duration: Duration(seconds: long ? 4 : 2),
  )..show(context);
}
