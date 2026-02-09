import 'package:flutter/material.dart';

import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../authentication/models/user_model.dart';
import '../widgets/customer_info.dart';
import '../widgets/customer_orders.dart';
import '../widgets/shipping_address.dart';

class CustomerMobileScreen extends StatelessWidget {
  const CustomerMobileScreen({super.key, required this.customer});
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
              CustomerInfo(customer: customer),
              const SizedBox(height: AbSizes.spaceBtwSections),
              
              /// Shipping Address
              const ShippingAddress(),
              const SizedBox(height: AbSizes.spaceBtwSections),
              
              const CustomerOrders()
            ],
          ),
        ),
      ),
    );
  }
}