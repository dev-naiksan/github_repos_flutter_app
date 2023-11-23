import 'package:flutter/material.dart';
import 'package:github_flutter_app/values/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final bool isLoading;
  final bool isDisabled;
  final bool isExpanded;
  final bool mini;
  final bool loginRequired;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.color = AppColor.PRIMARY_SWATCH,
    this.loginRequired = false,
  })  : mini = false,
        isExpanded = false,
        super(key: key);

  const PrimaryButton.mini({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.color = AppColor.PRIMARY_SWATCH,
    this.loginRequired = false,
  })  : mini = true,
        isExpanded = false,
        super(key: key);

  const PrimaryButton.expanded({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.color = AppColor.PRIMARY_SWATCH,
    this.loginRequired = false,
  })  : isExpanded = true,
        mini = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: ElevatedButton(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            height: 48,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            color == Colors.transparent
                                ? AppColor.PRIMARY_SWATCH
                                : Colors.white),
                        strokeWidth: 2.5,
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        fontSize: mini ? 12 : 18,
                        color: color == Colors.transparent
                            ? AppColor.BLACK
                            : Colors.white,
                      ),
                    ),
            ),
          ),
          onPressed: () {
            if (!isLoading && !isDisabled) onPressed.call();
          },
        ),
      ),
    );
  }
}

class StrokeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final bool isLoading;
  final bool isDisabled;
  final bool isExpanded;
  final bool loginRequired;

  const StrokeButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.color = AppColor.PRIMARY_SWATCH,
    this.loginRequired = false,
  })  : isExpanded = false,
        super(key: key);

  const StrokeButton.expanded({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.color = AppColor.PRIMARY_SWATCH,
    this.loginRequired = false,
  })  : isExpanded = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: FilledButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  width: 1,
                  color: color,
                ),
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        AppColor.PRIMARY_SWATCH),
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: color,
                  ),
                ),
          onPressed: () {
            if (!isLoading && !isDisabled) onPressed.call();
          },
        ),
      ),
    );
  }
}
