import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import 'package:ab_ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbLoginForm extends StatelessWidget {
  const AbLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: ,
      child: Padding(padding: const EdgeInsets.symmetric(
        vertical: AbSizes.spaceBtwSections
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AbTexts.email
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            /// Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Iconsax.eye_slash)),
                labelText: AbTexts.password
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields / 2),
            
            /// Remeber me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remeber me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(AbTexts.rememberMe)
                  ],
                ),
                 /// Forget Password
                 TextButton(onPressed: () => Get.toNamed(AbRoutes.forgetPassword), child: const Text(AbTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: AbSizes.spaceBtwSections),
            /// SignIn Button 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: const Text('Sign In')),
            )
          ],
        ),
      ),
    );
  }
}