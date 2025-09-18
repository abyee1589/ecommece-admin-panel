import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/reset_password_widget.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ResetPasswordMobileScreen extends StatelessWidget {
  const ResetPasswordMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}