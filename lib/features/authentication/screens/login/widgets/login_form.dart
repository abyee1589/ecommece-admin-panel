import 'package:ab_ecommerce_admin_panel/features/authentication/controllers/login_controller.dart';
import 'package:ab_ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbLoginForm extends StatelessWidget {
  const AbLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(padding: const EdgeInsets.symmetric(
        vertical: AbSizes.spaceBtwSections
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: AbValidator.validateEmail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AbTexts.email
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwInputFields),
            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: AbValidator.validatePassword,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                    icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),
                  ),
                  labelText: AbTexts.password
                ),
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
                    Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = value!)),
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
              child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIN(), child: const Text('Sign In')),
            )
          ],
        ),
      ),
    );
  }
}