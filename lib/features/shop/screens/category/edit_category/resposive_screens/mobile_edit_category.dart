
import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/category/edit_category/widgets/edit_category_form.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../models/category_model.dart';


class EditCategoryMobileScreen extends StatelessWidget {
  const EditCategoryMobileScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AbBreadcrumbsWithHeading(returnToPreviousScreen: true, heading: 'Update Category', breadcrumbItems: [AbRoutes.createCategory, 'Update Category']),
              const SizedBox(height: AbSizes.spaceBtwSections),
              EditCategoryForm(category: category,)
            ],
          ),
        ),
      ),
    );
  }
}