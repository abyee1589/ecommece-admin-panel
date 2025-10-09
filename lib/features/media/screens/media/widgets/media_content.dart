import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/ab_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/media_controller.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Images Header
           Row(
            children: [
              Text('Gallery Folders', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: AbSizes.spaceBtwItems),
              MediaFolderDropdown(onchanged: (MediaCategory? newValue) {
                if(newValue != null){
                  controller.selectedPath.value = newValue;
                }
              })
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwSections),
          /// Show Media 
          const Wrap(
                  alignment: WrapAlignment.start,
                  spacing: AbSizes.spaceBtwItems / 2,
                  runSpacing: AbSizes.spaceBtwItems / 2,
                  children: [
                    AbRoundedImage(
                      width: 90,
                      height: 90,
                      padding: AbSizes.sm,
                      imageType: ImageType.asset,
                      image: AbImages.adidasLogo,
                      // memoryImage: element.localImageToDisplay,
                      backgroundColor: AbColors.primaryBackground,
                    ),
                    AbRoundedImage(
                      width: 90,
                      height: 90,
                      padding: AbSizes.sm,
                      imageType: ImageType.asset,
                      image: AbImages.adidasLogo,
                      // memoryImage: element.localImageToDisplay,
                      backgroundColor: AbColors.primaryBackground,
                    ),
                    AbRoundedImage(
                      width: 90,
                      height: 90,
                      padding: AbSizes.sm,
                      imageType: ImageType.asset,
                      image: AbImages.adidasLogo,
                      // memoryImage: element.localImageToDisplay,
                      backgroundColor: AbColors.primaryBackground,
                    ),
                    AbRoundedImage(
                      width: 90,
                      height: 90,
                      padding: AbSizes.sm,
                      imageType: ImageType.asset,
                      image: AbImages.adidasLogo,
                      // memoryImage: element.localImageToDisplay,
                      backgroundColor: AbColors.primaryBackground,
                    ),
                    AbRoundedImage(
                      width: 90,
                      height: 90,
                      padding: AbSizes.sm,
                      imageType: ImageType.asset,
                      image: AbImages.adidasLogo,
                      // memoryImage: element.localImageToDisplay,
                      backgroundColor: AbColors.primaryBackground,
                    ),
                  ],
                ),
          /// Load More Media Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AbSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AbSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    onPressed: (){}, 
                    label: const Text('Load More'),
                    icon: const Icon(Iconsax.arrow_down),
                    style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: AbColors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}