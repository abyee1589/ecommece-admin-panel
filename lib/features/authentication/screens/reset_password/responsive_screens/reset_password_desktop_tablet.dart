import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/reset_password_widget.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return AbLoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}

