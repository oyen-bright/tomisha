import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tomisha/theme/app_colors.dart';

class WavyContainer extends StatelessWidget {
  final double height;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const WavyContainer({
    super.key,
    this.padding,
    required this.height,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyClipper(),
      child: Container(
        padding: padding ?? const EdgeInsets.only(top: 67, bottom: 71),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(102 * math.pi / 180),
            colors: [AppColors.lightBlue, AppColors.lightGreen],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        height: height,
        // color: color,
        child: child,
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.85);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.8,
    //     size.width * 0.5, size.height * 0.85);
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
