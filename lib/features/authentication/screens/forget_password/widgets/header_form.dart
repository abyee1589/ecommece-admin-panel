import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header  
        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        const SizedBox(height: AbSizes.spaceBtwItems),
        Text(AbTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AbSizes.spaceBtwItems),
        Text(AbTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: AbSizes.spaceBtwSections * 2),
    
        /// Form
        Form(
          child: TextFormField(
            decoration: const InputDecoration(labelText: AbTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
          )
        ),
        const SizedBox(height: AbSizes.spaceBtwSections),
    
        /// Submit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.toNamed(AbRoutes.resetPassword, parameters: {'email' :'abdibekele2021@gmail.com'}), child: const Text(AbTexts.submit)),
        ),
         const SizedBox(height: AbSizes.spaceBtwSections * 2),
      ],
    );
  }
}