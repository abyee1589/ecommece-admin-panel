import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductThumbnailImage extends StatelessWidget {
  const ProductThumbnailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Thumbnail', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AbSizes.spaceBtwItems),

          AbRoundedContainer(
            height: 300,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AbRoundedImage(width: 220, height: 220, imageType: ImageType.asset, image: AbImages.user)
                    ],
                  ),

                  SizedBox(width: 200, child: OutlinedButton(onPressed: (){}, child: const Text('Add Thumbnail')),)
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}