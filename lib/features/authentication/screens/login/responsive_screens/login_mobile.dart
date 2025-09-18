import 'package:ab_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              /// Header 
              AbLoginHeader(),
              /// Form 
              AbLoginForm()
            ],
          ),
        ),
      ),
    );
  }
}