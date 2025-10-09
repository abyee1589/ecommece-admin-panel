import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ab_ecommerce_admin_panel/features/media/screens/media/widgets/media_content.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../media/widgets/media_uploader.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Breadcrumbs
                        const AbBreadcrumbsWithHeading(heading: 'Media', breadcrumbItems: [AbRoutes.login, AbRoutes.forgetPassword, 'Media Screen']),
                        Flexible(
                          child: SizedBox(
                            width: AbSizes.buttonWidth * 1.5,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: AbColors.white),
                              onPressed: () => controller.showImagesUploaderSection.value = !controller.showImagesUploaderSection.value, 
                              icon: const Icon(Iconsax.cloud_add),
                              label: const Text('Upload Image'),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AbSizes.spaceBtwSections),

                    /// Media
                    const MediaUploader(),
                    const SizedBox(height: AbSizes.spaceBtwSections),

                    /// Upload Area
                    const MediaContent(),
                  ],
                ),
          ),
        ),
    );
  }
}
