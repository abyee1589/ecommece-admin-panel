
import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/models/banner_model.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/edit_banner_form.dart';



class EditBannerTabletScreen extends StatelessWidget {
  const EditBannerTabletScreen({super.key, required this.banner});
  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AbBreadcrumbsWithHeading(returnToPreviousScreen: true, heading: 'Update Banner', breadcrumbItems: [AbRoutes.editBanner, 'Update Banner']),
              const SizedBox(height: AbSizes.spaceBtwSections),
              EditBannerForm(banner: banner)
            ],
          ),
        ),
      ),
    );
  }
}