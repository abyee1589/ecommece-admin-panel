import 'dart:io';
import 'dart:typed_data';

import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:ab_ecommerce_admin_panel/utils/shimmers/shimmer_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AbCircularImage extends StatelessWidget {
  const AbCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = AbSizes.sm,
    this.image,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.memoryImage,
    this.imageType = ImageType.asset, 
    this.file,
  });
  final double width, height, padding;
  final String? image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Uint8List? memoryImage;
  final BoxFit? fit;
  final bool isNetworkImage;
  final File? file;
  final ImageType imageType;

  /// Function to handle Cloudinary URL and auto append `f_auto,q_auto`
  String _processUrl(String url) {
    if (url.contains("res.cloudinary.com")) {
      // If Cloudinary URL, inject `f_auto,q_auto` if not already present
      if (!url.contains("f_auto")) {
        // Example: split after /upload/
        return url.replaceFirst("/upload/", "/upload/f_auto,q_auto/");
      }
    }
    return url; // return unchanged if not Cloudinary
  }

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final finalUrl = _processUrl(image!);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? AbColors.black : AbColors.white),
        borderRadius: BorderRadius.circular(width >= height ? width: height),
      ),
      child: _buildImageWidget()
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;

    
    switch(imageType){
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemorykImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(width >= height ? width : height),
      child: imageWidget,
    );
  }

  Widget _buildNetworkImage(){
    if(image != null){
      return CachedNetworkImage(
        fit: fit,
        color: overlayColor,
        imageUrl: image!,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) => AbShimmerEffect(width: width, height: height),
      );
    }
    else {
      return Container();
    }
  }

  Widget _buildMemorykImage(){
    if(memoryImage != null){
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    }
    else {
      return Container();
    }
  }

  Widget _buildFileImage(){
    if(file != null){
      return Image(
        fit: fit,
        image: FileImage(file!),
        color: overlayColor,
      );
    }
    else {
      return Container();
    }
  }

  Widget _buildAssetImage(){
    if(image != null){
      return Image(
        fit: fit,
        image: AssetImage(image!),
        color: overlayColor,
      );
    }
    else {
      return Container();
    }
  }
}
