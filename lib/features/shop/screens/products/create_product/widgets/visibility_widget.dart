import 'package:flutter/material.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductVisibilityWidget extends StatelessWidget {
  const ProductVisibilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Visibility Headeer
          Text('Visibility', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AbSizes.spaceBtwItems),

          /// Radio buttons for product visisbilty
          Column(
            children: [
              _buildVisibilityRadioButton(ProductVisibiity.published, 'Published'),
              _buildVisibilityRadioButton(ProductVisibiity.hidden, 'Hidden'),
            ],
          )
        ]
      )
    );
  }

  Widget _buildVisibilityRadioButton(ProductVisibiity value, String label){
    return RadioMenuButton <ProductVisibiity>(
      value: value,
      groupValue: ProductVisibiity.published,
      onChanged: (selection) {},
      child: Text(label)
    );
  }
}