import 'package:flutter/material.dart';
import 'package:github_flutter_app/values/colors.dart';

import 'primary_button.dart';

class NoDataWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const NoDataWidget({Key? key, required this.message, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.2;
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              message ?? "No records found",
              style: TextStyle(fontSize: 16, color: AppColor.BLACK),
            ),
            SizedBox(
              height: 16,
            ),
            Visibility(
              visible: onRetry != null,
              child: PrimaryButton.mini(title: 'Retry', onPressed: onRetry),
            ),
          ],
        ),
      ),
    );
  }
}
