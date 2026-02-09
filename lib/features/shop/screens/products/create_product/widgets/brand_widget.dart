import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iconsax/iconsax.dart';

class ProductBrand extends StatelessWidget {
  const ProductBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AbSizes.spaceBtwItems),

          /// Type ahead for selection
          TypeAheadField(
            builder: (context, ctr, focusNode) {
              return TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Brand',
                  suffixIcon: Icon(Iconsax.box)
                ),
              );
            },
            suggestionsCallback: (pattern) {
              /// return filtered brand suggestions based the search pattern
              return [
                BrandModel(id: 'id', name: 'Adidas', image: AbImages.adidasLogo),
                BrandModel(id: 'id', name: 'Nike', image: AbImages.nikeLogo)
              ];
            },
            itemBuilder: (context, suggestion){
              return ListTile(title: Text(suggestion.name));
            },
            onSelected: (suggestion) {},
          )
        ],
      ),
    );
  }
}