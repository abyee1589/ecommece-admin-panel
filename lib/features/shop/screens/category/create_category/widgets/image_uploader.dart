import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_circular_image.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'circular_icon.dart';

class AbImageUploader extends StatelessWidget {
  const AbImageUploader({
    super.key,
    this.image, 
    this.onIconButtonPressed, 
    this.memoryImage, 
    this.width = 100, 
    this.height = 100, 
    required this.imageType, 
    this.circular = false, 
    this.icon = Iconsax.edit_2, 
    this.top, 
    this.bottom = 0, 
    this.left = 0, 
    this.right
  });

  final bool circular;
  final String? image;
  final ImageType imageType;
  final double width;
  final double height;
  final Uint8List? memoryImage;
  final IconData icon;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final VoidCallback? onIconButtonPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        circular
          ? AbCircularImage(
            image: image,
            width: width,
            height: height,
            imageType: imageType,
            backgroundColor: AbColors.primaryBackground,
          )
          : AbRoundedImage(
            image: image,
            width: width,
            height: height,
            imageType: imageType,
            backgroundColor: AbColors.primaryBackground
          ),
        Positioned(
          top: top,
          bottom: bottom,
          right: right,
          left: left,
          child: AbCircularIcon(
            icon: icon,
            size: AbSizes.md,
            color: Colors.white,
            onPressed: onIconButtonPressed,
            backgroundColor: AbColors.primary.withOpacity(0.9)
          )
        )
      ],
    );
  }
}