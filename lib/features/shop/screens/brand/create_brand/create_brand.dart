import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';
import 'resposive_screens/desktop_create_brand.dart';
import 'resposive_screens/mobile_create_brand.dart';
import 'resposive_screens/tablet_create_brand.dart';

class CreateBrandScreen extends StatelessWidget {
  const CreateBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const AbSiteTemplate(desktop: CreateBrandDesktopScreen(), tablet: CreateBrandTabletScreen(), mobile: CreateBrandMobileScreen());
  }
}