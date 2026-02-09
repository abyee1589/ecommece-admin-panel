import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'responsive_screen/desktop_customer.dart';
import 'responsive_screen/mobile_customer.dart';
class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = Get.arguments;
    return AbSiteTemplate(
      desktop: CustomerDesktopScreen(customer: customer), 
      mobile: CustomerMobileScreen(customer: customer)
    );
  }
}