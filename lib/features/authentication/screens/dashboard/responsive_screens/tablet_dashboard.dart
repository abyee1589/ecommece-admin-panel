import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import 'table/data_table.dart';
import 'widgets/dashboard_card.dart';
import 'widgets/order_status_graph.dart';
import 'widgets/weekly_sales.dart';

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
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),
              /// Graphs
              const AbWeeklySalesGraph(),
              const SizedBox(height: AbSizes.spaceBtwSections),
              
              /// Orders
              AbRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recent Orders', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: AbSizes.spaceBtwSections),
                    const SizedBox(
                      height: 400,
                      child: DashboardOrderTable()),
                  ],
                ),
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),
              /// Pie chart
              const OrderStatusPieChart()
            ],
          ),
        ),
      ),
    );
  }
}