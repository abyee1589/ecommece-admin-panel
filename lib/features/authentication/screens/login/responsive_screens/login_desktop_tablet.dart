import 'package:ab_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ab_ecommerce_admin_panel/layouts/templates/login_template.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbLoginTemplate(
      child: Column(
        children: [
          /// Header 
          AbLoginHeader(),
          /// Form 
          AbLoginForm()
        ],
      ),
    );
  }
}
