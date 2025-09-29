import 'package:ab_ecommerce_admin_panel/bindings/general_binding.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/responsive_design.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:ab_ecommerce_admin_panel/layouts/templates/site_layout.dart';
import 'package:ab_ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AbTexts.appName,
      // themeMode: ThemeMode.system,
      // theme: AbAppTheme.lightTheme,
      // darkTheme: AbAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      getPages: AppRoutes.pages,
      initialRoute: AbRoutes.dashboard,
      home: AbResponsiveWidget(desktop: const DesktopLayout(), tablet: TabletLayout(), mobile: MobileLayout()),
      unknownRoute: GetPage(name: '/Page-not-found', page: (() => const Scaffold(body: Center(child: Text('Page Not Fond'))))),
    );
  }
}