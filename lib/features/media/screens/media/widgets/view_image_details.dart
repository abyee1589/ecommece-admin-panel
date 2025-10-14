import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:ab_ecommerce_admin_panel/utils/popups/loaders.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../controllers/media_controller.dart';
import '../../../models/image_model.dart';

class ImagePopup extends StatelessWidget {
  const ImagePopup({super.key, required this.image});
    final ImageModel image;

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return SingleChildScrollView(
      child: Dialog(
        child: AbRoundedContainer(
          width: AbDeviceUtils.isDesktopScreen(context) ? MediaQuery.of(context).size.width * 0.4 : double.infinity,
          padding: const EdgeInsets.all(AbSizes.spaceBtwItems),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    AbRoundedContainer(
                      backgroundColor: AbColors.primaryBackground,
                      child: AbRoundedImage(
                        image: image.url,
                        applyImageRadius: true,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: AbDeviceUtils.isDesktopScreen(context) ? MediaQuery.of(context).size.width * 0.4 : double.infinity,
                        imageType: ImageType.network
                      ),
                    ),
                    Positioned(top: 0, right: 0, child: IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.close_circle)),)
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(child: Text('Image Name:', style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(flex: 3, child: Text(image.fileName, style: Theme.of(context).textTheme.titleLarge))
                ]
              ),
              Row(
                children: [
                  Expanded(child: Text('Image URL:', style: Theme.of(context).textTheme.bodyLarge)),
                  Expanded(flex: 2, child: Text(image.url, style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis)),
                  Expanded(child: OutlinedButton(
                    onPressed: () {
                      FlutterClipboard.copy(image.url).then((value) => AbLoaders.customToast(message: 'URL copied!'));
                    }, 
                    child: const Text('Copy URL')
                  )),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextButton(
                      onPressed: () => controller.removeCloudImageConfirmation(image),
                      child: const Text('Delete Image', style: TextStyle(color: Colors.red))
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}