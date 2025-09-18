import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/header_form.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ForgetPaswwordMobile extends StatelessWidget {
  const ForgetPaswwordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: Padding(
      padding: EdgeInsets.all(AbSizes.defaultSpace),
      child: HeaderAndForm(),
    ));
  }
}