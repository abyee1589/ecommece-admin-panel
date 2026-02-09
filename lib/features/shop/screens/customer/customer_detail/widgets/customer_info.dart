import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({super.key, required this.customer});
  final UserModel customer;
  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      padding: const EdgeInsets.all(AbSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer Information', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AbSizes.spaceBtwSections),

          /// Personal Info Card
          Row(
            children: [
              const AbRoundedImage(
                padding: 0,
                backgroundColor: AbColors.primaryBackground,
                image: AbImages.user,
                imageType: ImageType.asset,
              ),
              const SizedBox(height: AbSizes.spaceBtwItems),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coding with Ab', 
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const Text('abdibekele2021@gmail.com', overflow: TextOverflow.ellipsis, maxLines: 1)
                  ],
                )
              )
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwSections),

          /// Metadata
          Row(
            children: [
              const SizedBox(width: 120, child: Text('username')),
              const Text(':'),
              const SizedBox(width: AbSizes.spaceBtwItems / 2),
              Expanded(child: Text('cwab', style: Theme.of(context).textTheme.titleMedium))
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwItems),
          Row(
            children: [
              const SizedBox(width: 120, child: Text('Country')),
              const Text(':'),
              const SizedBox(width: AbSizes.spaceBtwItems / 2),
              Expanded(child: Text('Ethiopia', style: Theme.of(context).textTheme.titleMedium))
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwItems),
          Row(
            children: [
              const SizedBox(width: 120, child: Text('Phone Number')),
              const Text(':'),
              const SizedBox(width: AbSizes.spaceBtwItems / 2),
              Expanded(child: Text('+251-915-948-189', style: Theme.of(context).textTheme.titleMedium))
            ],
          ),
          const SizedBox(height: AbSizes.spaceBtwItems),
          const Divider(),
          const SizedBox(height: AbSizes.spaceBtwItems),

          /// Addititonal Details
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Last Order', style: Theme.of(context).textTheme.titleLarge),
                const Text('7 days ago, #[36d54]')
              ],
            )
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Average Order Value', style: Theme.of(context).textTheme.titleLarge),
                const Text('\$352')
              ],
            )
          ),
          const SizedBox(height: AbSizes.spaceBtwItems),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Registered', style: Theme.of(context).textTheme.titleLarge),
                // const Text(customer.formattedDate)
              ],
            )
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email Marketing', style: Theme.of(context).textTheme.titleLarge),
                const Text('Subscribed')
              ],
            )
          ),
        ],
      ),
    );
  }
}