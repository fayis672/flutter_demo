import 'package:flutter/material.dart';

const kTabletBreakpoint = 700.0;
const kDesktopBreakpoint = 1000.0;

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {Key? key, required this.mobile, this.tab, this.desktop})
      : super(key: key);
  final Widget mobile;
  final Widget? tab;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kTabletBreakpoint;

  static bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.width > kTabletBreakpoint &&
      MediaQuery.of(context).size.width < kDesktopBreakpoint;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width > kDesktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < kTabletBreakpoint) {
      return mobile;
    } else if (width < kDesktopBreakpoint) {
      return tab ?? mobile;
    } else if (width >= kDesktopBreakpoint) {
      return desktop ?? mobile;
    } else {
      return Container();
    }
  }
}
