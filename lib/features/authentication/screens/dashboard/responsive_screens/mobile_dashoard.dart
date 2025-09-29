import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import 'widgets/dashboard_card.dart';

class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({super.key});

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
              const AbDashboardCard(title: 'Sales totla', stats: 25, subTitle: '\$356.0',),
              const SizedBox(height: AbSizes.spaceBtwItems),
              const AbDashboardCard(title: 'Average Order Value', stats: 25, subTitle: '\$25.0',),
              const SizedBox(height: AbSizes.spaceBtwItems),
              const AbDashboardCard(title: 'Totla Order', stats: 25, subTitle: '35',),
              const SizedBox(height: AbSizes.spaceBtwItems),
              const AbDashboardCard(title: 'Visitors', stats: 25, subTitle: '25',)
            ],
          ),
        ),
      ),
    );
  }
}