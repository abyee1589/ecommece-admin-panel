import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/category/create_category/widgets/image_uploader.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/enums.dart';

class ProductAdditionalImages extends StatelessWidget {
  const ProductAdditionalImages({super.key, required this.additionalProductImageUrls, this.onTapToAddImages, this.onTapToRemoveImage});
  final RxList<String> additionalProductImageUrls;
  final void Function()? onTapToAddImages;
  final void Function(int index)? onTapToRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTapToAddImages,
              child: AbRoundedContainer(
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(AbImages.user, width: 50, height: 50),
                      const Text('Add Addititonal Product Images')
                    ],
                  ),
                ),
              ),
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 2, child: SizedBox(height: 80, child: _uploadedImagesOrEptyList())),
                const SizedBox(width: AbSizes.spaceBtwItems / 2),

                AbRoundedContainer(
                  width: 80,
                  height: 80,
                  showBorder: true,
                  borderColor: AbColors.grey,
                  backgroundColor: AbColors.white,
                  onTap: onTapToAddImages,
                  child: const Center(child: Icon(Iconsax.add)),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _uploadedImagesOrEptyList(){
    return emptyList();
  }

  Widget emptyList() {
    return ListView.separated(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (_, _) => const SizedBox(width: AbSizes.spaceBtwItems / 2),
      itemBuilder: (_, index) => const AbRoundedContainer(width: 80, height: 80, backgroundColor: AbColors.primaryBackground,),
    );
  }

   ListView _uploadedImages() {
    return ListView.separated(
      itemCount: additionalProductImageUrls.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: AbSizes.spaceBtwItems / 2),
      itemBuilder: (context, index) {
        final image = additionalProductImageUrls[index];
        return AbImageUploader(
          top: 0,
          right: 0,
          width: 80,
          height: 80,
          left: null,
          bottom: null,
          image: image,
          icon: Iconsax.trash,
          imageType: ImageType.network,
          onIconButtonPressed: () => onTapToRemoveImage!(index),
        );
      } 
    );
  }
}