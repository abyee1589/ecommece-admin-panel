import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ab_ecommerce_admin_panel/features/media/screens/media/widgets/folder_dropdown.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Column(
      children: [
        /// Drag and Drop Area
        AbRoundedContainer(
          height: 250,
          showBorder: true,
          borderColor: AbColors.borderPrimary,
          backgroundColor: AbColors.primaryBackground,
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DropzoneView(
                      mime: const ['image/jpg', 'image/jpeg', 'image/png'],
                      cursor: CursorType.Default,
                      operation: DragOperation.copy,
                      onLoaded: () => print('Zone Loaded'),
                      onError: (ev) => print('Zone Error $ev'),
                      onHover: () => print('Zone Hovered'),
                      onLeave: () => print('Zone Left'),
                      onCreated: (ctrl) => controller.dropzoneController = ctrl,
                      onDropFile: (file) {},
                      onDropInvalid: (ev) => print('Zone invalid MIME'),
                      onDropStrings: (ev) => 
                        print('Zone drop multiple $ev'),
                    ),
                    Column(
                      children: [
                        Image.asset(AbImages.defaultImageIcon, width: 50, height: 50),
                        const SizedBox(height: AbSizes.spaceBtwItems),
                        const Text('Drag and Drop Images Here'),
                        const SizedBox(height: AbSizes.spaceBtwItems),
                        OutlinedButton(
                          onPressed: (){}, 
                          child: const Text('Select Images')
                        )
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),
        AbRoundedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// Folders Dropdown
                  Row(
                    children: [
                      Text('Select Folder', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(width: AbSizes.spaceBtwItems),
                      MediaFolderDropdown(onchanged: (MediaCategory? newValue){
                        if(newValue != null){
                          controller.selectedPath.value = newValue;
                        }
                      })
                    ],
                  ),

                  /// Uplooad & Remove Buttons
                  Row(
                    children: [
                      TextButton(onPressed: (){}, child: const Text('Remove All')),
                      const SizedBox(width: AbSizes.spaceBtwItems),
                      AbDeviceUtils.isMobileScreen(context) 
                      ? const SizedBox.shrink()
                      :
                      SizedBox(width: AbSizes.buttonWidth, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: AbColors.white), onPressed: (){}, child: const Text('Upload')))
                    ],
                  )
                ],
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),

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
              const SizedBox(height: AbSizes.spaceBtwSections),
              AbDeviceUtils.isMobileScreen(context) 
              ? SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: AbColors.white,), onPressed: (){}, child: const Text('Upload')
                  )
                )
              : const SizedBox.shrink()
            ],
          ),
        )
        /// Locally Selected Images
      ],
    );
  }
}