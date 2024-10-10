import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget landScapeTablet;
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.landScapeTablet});

  static bool isMobile(BuildContext context) => context.isPhone;
  static bool isTablet(BuildContext context) => context.isTablet;
  static bool isLandScapeTablet(BuildContext context) =>
      context.isLandscape && context.isTablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (context.isPhone) {
        return mobile;
      } else if (context.isTablet) {
        if (context.isLandscape) {
          return landScapeTablet;
        } else {
          return tablet;
        }
      } else {
        return mobile;
      }
    });
  }
}
