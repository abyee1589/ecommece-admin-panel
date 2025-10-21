
import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../widgets/edit_brand_form.dart';

class EditBrandDesktopScreen extends StatelessWidget {
  const EditBrandDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AbBreadcrumbsWithHeading(returnToPreviousScreen: true, heading: 'Update Brand', breadcrumbItems: [AbRoutes.editBrand, 'Update Category']),
              SizedBox(height: AbSizes.spaceBtwSections),
              EditBrandForm()     
            ],
          ),
        ),
      ),
    );
  }
}