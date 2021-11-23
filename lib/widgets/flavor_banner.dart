import 'package:flutter/material.dart';

import '../flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;

  FlavorBanner({required this.child});

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;

    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
          message: FlavorConfig.currentFlavorName,
          textDirection: Directionality.of(context),
          layoutDirection: Directionality.of(context),
          location: BannerLocation.topStart,
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
          color: Colors.yellow,
        ),
      ),
    );
  }
}
