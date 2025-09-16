import 'dart:io';
import 'dart:typed_data';

import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AbRoundedImage extends StatelessWidget {
  const AbRoundedImage({
    super.key,
    this.image,
    this.width = 56,
    this.height = 56,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.borderRadius = AbSizes.md,
    this.isNetworkImage = false, 
    required this.file, 
    this.imageType, 
    this.overlayColor, 
    this.memoryImage, 
    this.margin,
  });

  final double? width, height, padding;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final double borderRadius;
  final String? image;
  final File file;
  final ImageType imageType;
  final Color? overlayColor;
  final Uint8List? memoryImage;
  final double? margin;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!): null,
    );
  }
}
