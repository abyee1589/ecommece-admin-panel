import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';
import 'resposive_screens/desktop_create_product.dart';
import 'resposive_screens/mobile_create_product.dart';
import 'resposive_screens/tablet_create_product.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: CreateProductDesktopScreen(), tablet: CreateProductTabletScreen(), mobile: CreateProductMobileScreen());
  }
}