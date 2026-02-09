import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../category/create_category/widgets/image_uploader.dart';
import 'rounded_choice_chip.dart';


class CreateBrandForm extends StatelessWidget {
  const CreateBrandForm({super.key});

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
            Text('Create New Brand', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AbSizes.spaceBtwSections),
            /// Name Text field
            TextFormField(
              validator: (value) => AbValidator.validateEmptyText('Name', value),
              decoration: InputDecoration(
                labelText: 'Brand Name', prefixIcon: const Icon(Iconsax.box),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // rounded corners
                  borderSide: const BorderSide(color: Colors.grey), // border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 1.2),
                ),
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),

            /// categories
            Text('Select categories', style: Theme.of(context).textTheme.titleMedium),
             const SizedBox(height: AbSizes.spaceBtwInputFields / 2),
            Wrap(
              spacing: AbSizes.sm,
              // direction: AbDeviceUtils.isMobileScreen(Get.context!) ? Axis.vertical : Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: AbSizes.sm),
                  child: AbChoiceChip(text: 'Shoes', selected: true, onSelected: (value){}),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: AbSizes.sm),
                  child: AbChoiceChip(text: 'Track Suits', selected: false, onSelected: (value){}),
                ),
              ],
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
            AbImageUploader(
              width: 80,
              height: 80,
              image: AbImages.user,
              imageType: ImageType.asset,
              onIconButtonPressed:  (){}
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),

            /// Image Uploader
            const AbImageUploader(imageType: ImageType.asset),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            Theme(
              data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                  fillColor: WidgetStateColor.resolveWith((states){
                    if(states.contains(WidgetState.selected)){
                      return AbColors.primary;
                    } 
                    else {
                      return Colors.grey.shade300;
                    }
                  }),
                  checkColor: WidgetStateProperty.all(Colors.white), // ✅ tick mark color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // optional rounded corners
                  ),
                )
              ), 
              child: CheckboxMenuButton(
                value: true,
                onChanged: (value){}, 
                child: const Text('Featured')
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: Colors.white),child: const Text('Create')),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields * 2)
          ],
        ),
      ),
    );
  }
}