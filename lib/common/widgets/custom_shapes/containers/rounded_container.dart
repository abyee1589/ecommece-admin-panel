import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class AbRoundedContainer extends StatelessWidget {
  const AbRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = AbSizes.borderRadiusLg,
    this.showshadow = true,
    this.showBorder = false,
    this.padding,
    this.margin,
    this.backgroundColor = AbColors.white,
    this.borderColor = AbColors.borderPrimary, 
    this.onTap,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showshadow;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null,
          boxShadow: [
            if(showshadow)
              BoxShadow(
                color: AbColors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 3)
              )
          ]
        ),
        child: child,
      ),
    );
  }
}
