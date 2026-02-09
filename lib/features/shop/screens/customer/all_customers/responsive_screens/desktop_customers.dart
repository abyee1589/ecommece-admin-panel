import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../table/data_table.dart';

class CustomersDesktopScreen extends StatelessWidget {
  const CustomersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Breadcrumbs
              AbBreadcrumbsWithHeading(heading: 'Customers', breadcrumbItems: ['Customers']),
              SizedBox(height: AbSizes.spaceBtwSections),

              AbRoundedContainer(
                child: Column(
                  children: [
                    /// Table Header
                    AbTableHeader(showLeftWidget: false),
                    SizedBox(height: AbSizes.spaceBtwItems),

                    CustomerTable()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}