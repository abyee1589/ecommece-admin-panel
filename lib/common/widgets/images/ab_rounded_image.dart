import 'dart:io';
import 'dart:typed_data';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/shimmers/shimmer_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    this.padding = AbSizes.sm,
    this.borderRadius = AbSizes.md,
    this.isNetworkImage = false, 
    this.file, 
    required this.imageType, 
    this.overlayColor, 
    this.memoryImage, 
    this.margin,
  });

  final double width, height, padding;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final double borderRadius;
  final String? image;
  final File? file;
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
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: _buildImageWidget(),
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
      borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
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
