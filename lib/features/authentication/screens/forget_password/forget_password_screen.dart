import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/screens/forget_password/responsive_screens/forget_password_mobile.dart';
import 'package:ab_ecommerce_admin_panel/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(useLayout: false, desktop: ForgetPasswordDesktopTablet(), mobile: ForgetPaswwordMobile());
  }
}