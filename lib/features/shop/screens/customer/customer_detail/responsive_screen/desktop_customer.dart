import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/customer_info.dart';
import '../widgets/customer_orders.dart';
import '../widgets/shipping_address.dart';

class CustomerDesktopScreen extends StatelessWidget {
  const CustomerDesktopScreen({super.key, required this.customer});
  final UserModel customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Breadcrumbs
              const AbBreadcrumbsWithHeading(
                returnToPreviousScreen: false,
                heading: 'Abdi Bekele', 
                breadcrumbItems: ['Details']
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),
          
            /// Body
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      /// Customer Info
                      CustomerInfo(customer: customer),
                      const SizedBox(height: AbSizes.spaceBtwSections),
                      
                      /// Shipping Address
                      const ShippingAddress()
                    ],
                  )
                ),
                const Expanded(
                  flex: 2,
                  child: CustomerOrders()
                )
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}