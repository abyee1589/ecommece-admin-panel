
import 'package:ab_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../widgets/additional_images.dart';
import '../widgets/attributes_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/brand_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/producta_type_widget.dart';
import '../widgets/stock_pricing_widget.dart';
import '../widgets/thumbnail_widget.dart';
import '../widgets/title_description.dart';
import '../widgets/variations_widget.dart';
import '../widgets/visibility_widget.dart';


class CreateProductDesktopScreen extends StatelessWidget {
  const CreateProductDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ProductBottomNavigationButtons(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AbBreadcrumbsWithHeading(returnToPreviousScreen: true, heading: 'Create Product', breadcrumbItems: [AbRoutes.createBanner, 'Create Product']),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Create Product
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: AbDeviceUtils.isTabletScreen(context) ? 2 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Basic Information
                        const ProductTitleAndDescription(),
                        const SizedBox(width: AbSizes.spaceBtwSections),

                        /// Stock & Pricing
                        AbRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Stock & Pricing', style: Theme.of(context).textTheme.headlineMedium),
                              const SizedBox(height: AbSizes.spaceBtwItems),

                              /// Product Type
                              const ProductTypeWidget(),
                              const SizedBox(height: AbSizes.inputFieldRadius),

                              /// Stock
                              const ProductStockAndPricing(),
                              const SizedBox(height: AbSizes.spaceBtwSections),
                              const ProductAttributes(),
                              const SizedBox(height: AbSizes.spaceBtwSections),
                            ],
                          ),
                        ),
                        const SizedBox(height: AbSizes.spaceBtwSections),
                        const ProductVariations()
                      ],
                    )),
                  const SizedBox(width: AbSizes.defaultSpace),
                  Expanded(
                    child: Column(
                      children: [
                        const ProductThumbnailImage(),
                        const SizedBox(height: AbSizes.spaceBtwSections),

                        /// Product Images
                        AbRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('All Product Images', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: AbSizes.spaceBtwItems),
                              // ProductAdditionalImages(
                              //   additionalProductImagesUrls: RxList<String>.empty,
                              //   onTapToAddImages: (){},
                              //   onTapToRemoveImages: (index){}
                              // )
                            ],
                          ),
                        ),
                        const SizedBox(height: AbSizes.spaceBtwSections),

                        const ProductBrand(),
                        const SizedBox(height: AbSizes.spaceBtwSections),

                        const ProductCategory(),
                        const SizedBox(height: AbSizes.spaceBtwSections),

                        const ProductVisibilityWidget(),
                        const SizedBox(height: AbSizes.spaceBtwSections),
                      ],
                    )
                  )
                ],
              )
              // CreateProductForm()
            ],
          ),
        ),
      ),
    );
  }
}