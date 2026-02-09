import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/validators/validation.dart';
import 'package:flutter/material.dart';

class ProductTitleAndDescription extends StatelessWidget {
  const ProductTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Basic Information', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AbSizes.spaceBtwItems),

            TextFormField(
              validator: (value) => AbValidator.validateEmptyText('Product Title', value),
              decoration: const InputDecoration(labelText: 'Product Title'),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),

            /// Product Description Input Field
            SizedBox(
              height: 300,
              child: TextFormField(
                expands: true,
                maxLines: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                validator: (value) => AbValidator.validateEmptyText('Product Description', value),
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  hintText: 'Add your product description here...',
                  alignLabelWithHint: true
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}