import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'image_uploader.dart';

class CreateCategoryForm extends StatelessWidget {
  const CreateCategoryForm({super.key});

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
            Text('Create New Category', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AbSizes.spaceBtwSections),
            /// Name Text field
            TextFormField(
              validator: (value) => AbValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(labelText: 'Category Name', prefixIcon: Icon(Iconsax.category)),
            ),
            const SizedBox(height: AbSizes.inputFieldRadius),
            DropdownButtonFormField(
              decoration: const InputDecoration(hintText: 'Parent Category', labelText: 'Parent Categor', prefixIcon: Icon(Iconsax.bezier)),
              onChanged: (newValue){},
              items: const [
                DropdownMenuItem(
                  value: '',
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Item Name')
                    ],
                  ))
              ], 
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
            AbImageUploader(
              width: 80,
              height: 80,
              image: AbImages.user,
              imageType: ImageType.asset,
              icon: Iconsax.edit,
              onIconButtonPressed:  (){}
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            CheckboxMenuButton(
              value: true,
              onChanged: (value){},
              child: const Text('Featured'),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: Colors.white),child: const Text('Create')),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}