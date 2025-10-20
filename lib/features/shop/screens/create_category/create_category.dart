import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/create_category/resposive_screens/mobile_create_category.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/create_category/resposive_screens/tablet_create_category.dart';
import 'package:flutter/material.dart';

import 'resposive_screens/desktop_create_category.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const AbSiteTemplate(desktop: CreateCategoryDesktopScreen(), tablet: CreateCategoryTabletScreen(), mobile: CreateCategoryMobileScreen());
  }
}