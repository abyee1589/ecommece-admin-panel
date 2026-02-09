import 'package:ab_ecommerce_admin_panel/features/shop/screens/customer/all_customers/responsive_screens/desktop_customers.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/customer/all_customers/responsive_screens/mobile_customers.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/customer/all_customers/responsive_screens/tablet_customers.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: CustomersDesktopScreen(), tablet: CustomersTabletScreen(), mobile: CustomersMobileScreen());
  }
}