import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import 'resposive_screens/desktop_banners.dart';
import 'resposive_screens/mobile_banners.dart';
import 'resposive_screens/tablet_banners.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});
  // final banner = BannerModel();
  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: BannersDesktopScreen(), tablet: BannersTabletScreen(), mobile: BannersMobileScreen(),);
  }
}