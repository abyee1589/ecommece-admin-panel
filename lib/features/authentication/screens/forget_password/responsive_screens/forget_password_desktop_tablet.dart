import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/header_form.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter/material.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbLoginTemplate(
      child: HeaderAndForm(),
    );
  }
}