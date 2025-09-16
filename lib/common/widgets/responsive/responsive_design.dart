import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AbResponsiveWidget extends StatelessWidget {
  const AbResponsiveWidget({super.key, required this.desktop, required this.tablet, required this.mobile});
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if(constraints.maxWidth >= AbSizes.desktopScreenSize){
          return desktop;
        }
        else if(constraints.maxWidth < AbSizes.desktopScreenSize && constraints.maxWidth >= AbSizes.tabletScreenSize){
          return tablet;
        }
        else {
          return mobile;
        }
      },
    );
  }
}