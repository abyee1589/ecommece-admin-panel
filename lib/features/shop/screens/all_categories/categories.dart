
import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import 'resposive_screens/mobile_categories.dart';
import 'resposive_screens/tablet_categories.dart';
import 'resposive_screens/desktop_categories.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const AbSiteTemplate(desktop: CategoriesDesktopScreen(), tablet: CategoriesTabletScreen(), mobile: CategoriesMobileScreen());
  }
}