import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:ab_ecommerce_admin_panel/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: AbColors.primaryBackground),
        const SizedBox(height: AbSizes.spaceBtwSections),
        
        Text('Add Product Attributes', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AbSizes.spaceBtwItems),

        /// Form to add new attributes
        Form(
          child: AbDeviceUtils.isDesktopScreen(context) 
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildAttributeName()
                ),
                const SizedBox(height: AbSizes.spaceBtwItems),
                Expanded(
                  flex: 2,
                  child: _buildAttributeTextField()
                ),
                const SizedBox(height: AbSizes.spaceBtwItems),
                 _buildAttributeButton()
              ],
            ) : Column(
              children: [
                _buildAttributeName(),
                const SizedBox(height: AbSizes.spaceBtwItems),
                _buildAttributeTextField(),
                const SizedBox(height: AbSizes.spaceBtwItems),
                _buildAttributeButton()
              ],
            )
        ), 
        const SizedBox(height: AbSizes.spaceBtwSections),

        /// List of added attributes
        Text('All Attributes', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: AbSizes.spaceBtwItems),

        /// Diplay Added Attributes in Rounded Container
        AbRoundedContainer(
          backgroundColor: AbColors.primaryBackground,
          child: Column(
            children: [
              buildAttributesList(context),
              buildEmptyAttributes()
            ],
          ),
        ),
        const SizedBox(height: AbSizes.spaceBtwSections),

        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Iconsax.activity),
              label: const Text('Generate Variations')
            ),
          ),
        )

      ],
    );
  }

  SizedBox _buildAttributeTextField() {
    return SizedBox(
      height: 80,
      child: TextFormField(
        expands: true,
        maxLength: null,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        validator: (value) => AbValidator.validateEmptyText('Attributes Field', value),
        decoration: const InputDecoration(
          labelText: 'Attributes',
          hintText: 'Add Attributes Value Separated by | Example Green | Blue | Yelow',
          alignLabelWithHint: true
        ),
      ),
    );
  }

  SizedBox _buildAttributeButton() {
    return SizedBox(
      width: 100,
      child: ElevatedButton.icon(
        onPressed: (){},
        icon: const Icon(Iconsax.add),
        style: ElevatedButton.styleFrom(
          foregroundColor: AbColors.black,
          backgroundColor: AbColors.secondary,
          side: const BorderSide(color: AbColors.secondary)
        ),
        label: const Text('Add'),
      ),
    );
  }

  TextFormField _buildAttributeName(){
    return TextFormField(
      validator: (value) => AbValidator.validateEmptyText('Attribute Name', value),
      decoration: const InputDecoration(labelText: 'Attribute Name', hintText: 'Colors, Sizes, Materials'),
    );
  }

  ListView buildAttributesList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, _) => const SizedBox(height: AbSizes.spaceBtwItems), 
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: AbColors.white,
            borderRadius: BorderRadius.circular(AbSizes.borderRadiusLg),
          ),
          child: ListTile(
            title: const Text('Color'),
            subtitle: const Text('Green, Orange, Pink'),
            trailing: IconButton(
              onPressed: (){}, 
              icon: const Icon(Iconsax.trash, color: AbColors.error,),
            ),
          ),
        );
      }, 
    );
  }

  Column buildEmptyAttributes() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbRoundedImage(width: 150, height: 80, imageType: ImageType.asset, image: AbImages.user,)
          ],
        ),
        SizedBox(height: AbSizes.spaceBtwItems),
        Text('There is no attribute for this product!')
      ],
    );
  }
}