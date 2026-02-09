
import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import 'responsive_design/desktop_products.dart';
import 'responsive_design/mobile_produtcs.dart';
import 'responsive_design/tablet_product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const AbSiteTemplate(desktop: ProductsDesktopScreen(), tablet: ProductsMobileScreen(), mobile: ProductsTabletScreen());
  }
}