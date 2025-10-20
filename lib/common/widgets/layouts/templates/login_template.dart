import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/spacong_style.dart';
import 'package:ab_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AbLoginTemplate extends StatelessWidget {
  const AbLoginTemplate({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: AbSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AbSizes.cardRadiusLg),
                color: AbHelperFunctions.isDarkMode(context) ? AbColors.black : AbColors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}