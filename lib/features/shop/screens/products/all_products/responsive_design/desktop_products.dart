
import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../common/widgets/data_table/table_header.dart';
import '../table/data_table.dart';

class ProductsDesktopScreen extends StatelessWidget {
  const ProductsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AbBreadcrumbsWithHeading(heading: 'Products', breadcrumbItems: ['Products']),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Table Body
               AbRoundedContainer(
                  child: Column(
                    children: [

                      /// Table Header
                      AbTableHeader(buttonText: 'Add Product', onPressed: () => Get.toNamed(AbRoutes.createProduct),),
                      const SizedBox(height: AbSizes.spaceBtwItems),

                      /// Table
                      const ProductsTable(),
                    ],
                  ),
              )
            ]
          )
        )
      )
    );
  }
}