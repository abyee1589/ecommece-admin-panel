import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/products/edit_product/resposive_screens/desktop_edit_banner.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/products/edit_product/resposive_screens/mobile_edit_banner.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/products/edit_product/resposive_screens/tablet_edit_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;
    return AbSiteTemplate(
      desktop: EditProductDesktopScreen(product: product), 
      tablet: EditProductTabletScreen(product: product), 
      mobile: EditProductMobileScreen(product: product)
    );
  }
}