import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AbSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top:  AbSizes.appBarHeight,
    bottom: AbSizes.defaultSpace,
    left: AbSizes.defaultSpace,
    right: AbSizes.defaultSpace
  );
}