import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import 'resposive_screens/desktop_create_banner.dart';
import 'resposive_screens/mobile_create_banner.dart';
import 'resposive_screens/tablet_create_banner.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: CreateBannerDesktopScreen(), tablet: CreateBannerTabletScreen(), mobile: CreateBannerMobileScreen(),);
  }
}