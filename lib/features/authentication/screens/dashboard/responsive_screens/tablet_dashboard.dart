import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/dashboard_card.dart';

class TabletDashboardScreen extends StatelessWidget {
  const TabletDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Heading
              Text('Dahsboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Cards
              const Row(
                children: [
                  Expanded(child: AbDashboardCard(title: 'Totla Sales', stats: 25, subTitle: '\$356.0',)),
                  SizedBox(width: AbSizes.spaceBtwItems),
                  Expanded(child: AbDashboardCard(title: 'Average Order Value', stats: 25, subTitle: '\$25.0',)),
                ],
              ),
              const SizedBox(height: AbSizes.spaceBtwItems),
              const Row(
                children: [
                  Expanded(child: AbDashboardCard(title: 'Totla Order', stats: 25, subTitle: '35',)),
                  SizedBox(width: AbSizes.spaceBtwItems),
                  Expanded(child: AbDashboardCard(title: 'Visitors', stats: 25, subTitle: '25',)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}