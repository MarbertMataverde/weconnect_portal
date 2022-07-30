import 'package:flutter/material.dart';

// Screen sizes
const double phoneSize = 640;
const double tabletSize = 641;
const double tabletBreakPointSize = 1007;
const double desktopSize = 1008;

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= phoneSize) {
          return phone;
        } else if (constraints.maxWidth >= tabletSize &&
            constraints.maxWidth <= tabletBreakPointSize) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
