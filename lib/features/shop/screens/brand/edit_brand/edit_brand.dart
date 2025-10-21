import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import 'resposive_screens/desktop_edit_brand.dart';
import 'resposive_screens/mobile_edit_brand.dart';
import 'resposive_screens/tablet_edit_brand.dart';


class EditBrandScreen extends StatelessWidget {
  const EditBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const AbSiteTemplate(desktop: EditBrandDesktopScreen(), tablet: EditBrandTabletScreen(), mobile: EditBrandMobileScreen());
  }
}