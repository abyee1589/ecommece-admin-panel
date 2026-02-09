import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Categories', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AbSizes.spaceBtwItems),

          /// MultiselectDialogField for selecting categories
          MultiSelectDialogField(
            buttonText: const Text('Select Categories'),
            title: const Text('Categories'),
            items: [
              MultiSelectItem(CategoryModel(id: 'id', name: 'Shoes', image: AbImages.shoeIcon), 'Shoes'),
              MultiSelectItem(CategoryModel(id: 'id', name: 'Shoes', image: AbImages.shoeIcon), 'Shoes')
            ],
            listType: MultiSelectListType.CHIP,
            onConfirm: (value) {}
          )
        ],
      ),
    );
  }
}