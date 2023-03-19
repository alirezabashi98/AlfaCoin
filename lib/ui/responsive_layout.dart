import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget MobileScaffold;
  final Widget TabletScaffold;
  final Widget DesktopScaffold;
  ResponsiveLayout({
    required this.MobileScaffold,
    required this.TabletScaffold,
    required this.DesktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return MobileScaffold;
        } else if (constraints.maxWidth < 1100) {
          return TabletScaffold;
        } else {
          return DesktopScaffold;
        }
      },
    );
  }
}
