import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/resposive_screens/mobile_edit_banner.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/resposive_screens/tablet_edit_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'resposive_screens/desktop_edit_banner.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = Get.arguments;
    return AbSiteTemplate(
      desktop: EditBannerDesktopScreen(banner: banner), 
      tablet: EditBannerTabletScreen(banner: banner), 
      mobile: EditBannerMobileScreen(banner: banner)
    );
  }
}