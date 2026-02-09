import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class CreateBannerForm extends StatelessWidget {
  const CreateBannerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(AbSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            const SizedBox(height: AbSizes.sm),
            Text('Create New Banner', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AbSizes.spaceBtwSections),
            /// Image Uploader & Featured checkbox
            Column(
              children: [
                GestureDetector(
                  child: const AbRoundedImage(
                    width: 400,
                    height: 200,
                    backgroundColor: AbColors.primaryBackground,
                    image: AbImages.user,
                    imageType: ImageType.asset
                  ),
                ),
                const SizedBox(height: AbSizes.spaceBtwItems),
                TextButton(onPressed: (){}, child: const Text('Select Image'))
              ],
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            Text('Make Your banner Active or Inactive', style: Theme.of(context).textTheme.bodyMedium),
            CheckboxMenuButton(value: true, onChanged: (value){}, child: const Text('Active')),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            DropdownButton<String>(
              value: 'search', 
              onChanged: (String ? newValue){}, items: const [
                DropdownMenuItem<String>(value: 'search', child: Text('Search')),
                DropdownMenuItem<String>(value: 'home', child: Text('Home')),
              ] 
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Create'))),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}