import 'package:ab_ecommerce_admin_panel/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ResetPasswordWidget extends StatelessWidget {
  ResetPasswordWidget({
    super.key,
  });
  final email = Get.parameters['email'] ?? '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header 
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () => Get.offAllNamed(AbRoutes.login), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),
        
        /// Image
        const Image(image: AssetImage(AbImages.deliveredEmailIllustration), width: 300, height: 300),
        const SizedBox(height: AbSizes.spaceBtwItems),
    
        /// Title And Subtitle
        Text(AbTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: AbSizes.spaceBtwItems),
        Text(email, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
        const SizedBox(height: AbSizes.spaceBtwItems),
        Text(AbTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
        const SizedBox(height: AbSizes.spaceBtwSections),
    
        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.offAllNamed(AbRoutes.login), child: const Text(AbTexts.done)),
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: (){}, child: const Text(AbTexts.resendEmail)),
        ),
      ],
    );
  }
}