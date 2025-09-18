import 'package:ab_ecommerce_admin_panel/features/authentication/screens/login/responsive_screens/login_desktop_tablet.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/screens/login/responsive_screens/login_mobile.dart';
import 'package:ab_ecommerce_admin_panel/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(useLayout: false, desktop: LoginScreenDesktopTablet(), mobile: LoginScreenMobile());
  }
}