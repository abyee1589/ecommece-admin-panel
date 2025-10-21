
import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'resposive_screens/desktop_brands.dart';
import 'resposive_screens/mobile_brands.dart';
import 'resposive_screens/tablet_brands.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = BrandModel(id: '', name: '', image: '');
    return  AbSiteTemplate(desktop: BrandsDesktopScreen(brand: brand), tablet: BrandsTabletScreen(brand: brand), mobile: BrandsMobileScreen(brand: brand));
  }
}