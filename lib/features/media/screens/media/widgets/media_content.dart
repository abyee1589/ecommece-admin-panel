import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/ab_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/media_controller.dart';
import '../../../models/image_model.dart';
import 'view_image_details.dart';

class MediaContent extends StatelessWidget {
  MediaContent({
    super.key, 
    required this.allowSelection, 
    required this.allowMultipleSelection, 
    this.alreadySelectedUrls, 
    this.onSelected
  });
  final bool allowSelection;
  final bool allowMultipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onSelected;

  @override
  Widget build(BuildContext context) {
    bool loadedPreviousSelection = false;
    final controller = MediaController.instance;
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Images Header
          Row(
            children: [
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
              if(allowSelection) buildAddSelectedImagesButton()
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwSections),
          /// Show Media 
          Obx(
            () {
              List<ImageModel> images = getSelectedFolderImages(controller);
              if(!loadedPreviousSelection) {
                if(alreadySelectedUrls != null && alreadySelectedUrls!.isNotEmpty){
                  final selectedUrlsSet = Set<String>.from(alreadySelectedUrls!);
                  for(var image in images){
                    image.isSelected.value = selectedUrlsSet.contains(image.url);
                    if(image.isSelected.value){
                      selectedImages.add(image);
                    }
                  }
                }
                else {
                  for(var image in images){
                    image.isSelected.value = false;
                  }
                }
                loadedPreviousSelection = true;
              }
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
                    onTap: () => Get.dialog(ImagePopup(image: image)),
                    child: SizedBox(
                      width: 140,
                      height: 180,
                      child: Column(
                        children: [
                          allowSelection ? _buildListWithCheckbox(image) : _buildSimpleImage(image),
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

          if(!controller.loading.value)
            /// Load More Media Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AbSizes.spaceBtwSections),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AbSizes.buttonWidth,
                    child: ElevatedButton.icon(
                      onPressed: () => controller.loadMoreMedaiImages(), 
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

  Widget _buildSimpleImage(ImageModel image) {
    return AbRoundedImage(
      width: 140,
      height: 140,
      padding: AbSizes.sm,
      image: image.url,
      imageType: ImageType.network,
      margin: AbSizes.spaceBtwItems / 2,
      backgroundColor: AbColors.primaryBackground,
    );
  }

  Widget _buildListWithCheckbox(ImageModel image) {
    return Stack(
      children: [
        AbRoundedImage(
          width: 140,
          height: 140,
          padding: AbSizes.sm,
          image: image.url,
          imageType: ImageType.network,
          margin: AbSizes.spaceBtwItems / 2,
          backgroundColor: AbColors.primaryBackground,
        ),
        Positioned(
          top: AbSizes.md,
          right: AbSizes.md,
          child: Obx(() => 
            Checkbox(
              value: image.isSelected.value, 
              onChanged: (value) {
                if(value != null){
                  image.isSelected.value = value;
                  if(value){
                    if(!allowMultipleSelection){
                      for(var otherImage in selectedImages){
                        if(otherImage != image){
                          otherImage.isSelected.value = false;
                        }
                      }
                      selectedImages.clear();
                    }
                    selectedImages.add(image);
                  }
                  else{
                    selectedImages.remove(image);
                  }
                }
              }
            )
          ),
        )
      ]
    );
  }

  Widget buildAddSelectedImagesButton() {
    return Row(
      children: [
        SizedBox(
          child: OutlinedButton.icon(label: const Text('Close'), icon: const Icon(Iconsax.close_circle), onPressed: () => Get.back()),
        ),
        const SizedBox(width: AbSizes.spaceBtwItems),
        SizedBox(
          child: ElevatedButton.icon(label: const Text('Add'), icon: const Icon(Iconsax.close_circle), onPressed: () => Get.back(result: selectedImages)),
        ),
      ],
    );
  }
}