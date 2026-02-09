import 'package:flutter/material.dart';
import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductBottomNavigationButtons extends StatelessWidget {
  const ProductBottomNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// Discard Button
          OutlinedButton(onPressed: (){}, child: const Text('Discard')),
          const SizedBox(width: AbSizes.spaceBtwItems / 2),

          /// Saved Button
          SizedBox(width: 160, child: ElevatedButton(onPressed: (){}, child: const Text('Save Changes')))
        ]
      )
    );
  }
}