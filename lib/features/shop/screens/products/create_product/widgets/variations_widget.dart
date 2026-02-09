import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/category/create_category/widgets/image_uploader.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../../common/widgets/images/ab_rounded_image.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Product Variations', style: Theme.of(context).textTheme.headlineSmall),
              TextButton(onPressed: (){}, child: const Text('Remove Variations')),
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwItems),

          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (_, _) => const SizedBox(height: AbSizes.spaceBtwItems),
            itemBuilder: (_, index) => _buildVariationTile() 
          ),

          _buildNoVariationMessage()
        ],
      ),
    );
  }

  Widget _buildVariationTile(){
    return ExpansionTile(
      backgroundColor: AbColors.lightGrey,
      collapsedBackgroundColor: AbColors.lightGrey,
      childrenPadding: const EdgeInsets.all(AbSizes.md),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AbSizes.borderRadiusLg)),
      title: const Text('Color: Green, Size: Small'),
      children: [
        Obx(() => AbImageUploader(
          right: 0,
          left: null,
          imageType: ImageType.asset,
          image: AbImages.user,
          onIconButtonPressed: (){},
          )
        ),
        const SizedBox(height: AbSizes.spaceBtwInputFields),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Stock', hintText: 'Add Stock, Only Number is allowed!'),
              )
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))],
                decoration: const InputDecoration(labelText: 'Price', hintText: 'Price with up-to 2 decimal'),
              )
            ),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwInputFields),
        TextFormField(decoration: const InputDecoration(labelText: 'Describtion', hintText: 'Add describtion of this variation...'),)
      ],
    );
  }

  Widget _buildNoVariationMessage() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbRoundedImage(width: 200, height: 200, imageType: ImageType.asset, image: AbImages.user,)
          ],
        ),
        SizedBox(height: AbSizes.spaceBtwItems),
        Text('There is no attribute for this product!')
      ],
    );
  }
}