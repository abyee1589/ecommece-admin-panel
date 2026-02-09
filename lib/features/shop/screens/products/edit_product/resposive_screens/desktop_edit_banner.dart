
import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../models/product_model.dart';




class EditProductDesktopScreen extends StatelessWidget {
  const EditProductDesktopScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AbBreadcrumbsWithHeading(returnToPreviousScreen: true, heading: 'Update Product', breadcrumbItems: [AbRoutes.editProduct, 'Update Product']),
              SizedBox(height: AbSizes.spaceBtwSections),
              // EditBannerForm(banner: banner)
            ],
          ),
        ),
      ),
    );
  }
}