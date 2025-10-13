import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/ab_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/media_controller.dart';
import '../../../models/image_model.dart';

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
                  controller.getMediaImages();
                }
              })
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwSections),
          /// Show Media 
          Obx(
            () {
              List<ImageModel> images = getSelectedFolderImages(controller);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: AbSizes.spaceBtwItems / 2,
                  runSpacing: AbSizes.spaceBtwItems / 2,
                  children: images.map((image) => 
                  GestureDetector(
                    onTap: (){},
                    child: SizedBox(
                      width: 140,
                      height: 180,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AbSizes.sm),
                              child: Text(image.fileName, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            )
                          )
                        ],
                      ),
                    ),
                  )).toList()
                ),
              ],
            );
            }
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

  List<ImageModel> getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    if(controller.selectedPath.value == MediaCategory.banners){
      images = controller.allBannerImages.where((image) => image.url.isNotEmpty).toList();
    }
    else if(controller.selectedPath.value == MediaCategory.brands){
      images = controller.allBrandImages.where((image) => image.url.isNotEmpty).toList();
    }
    else if(controller.selectedPath.value == MediaCategory.categories){
      images = controller.allCategoryImages.where((image) => image.url.isNotEmpty).toList();
    }
    else if(controller.selectedPath.value == MediaCategory.products){
      images = controller.allProductImages.where((image) => image.url.isNotEmpty).toList();
    }
    else if(controller.selectedPath.value == MediaCategory.users){
      images = controller.allUserImages.where((image) => image.url.isNotEmpty).toList();
    }

    return images;
  }
}