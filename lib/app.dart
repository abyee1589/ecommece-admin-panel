import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/responsive_design.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:ab_ecommerce_admin_panel/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:ab_ecommerce_admin_panel/layouts/templates/site_layout.dart';
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
      themeMode: ThemeMode.light,
      theme: AbAppTheme.lightTheme,
      darkTheme: AbAppTheme.darkTheme,
      // getPages: AppRoutes.pages,
      // initialRoute: ,
      home: AbResponsiveWidget(desktop: DesktopLayout(), tablet: TabletLayout(), mobile: MobileLayout()),
      unknownRoute: GetPage(name: '/Page Not Found', page: (() => const Scaffold(body: Center(child: Text('Page Not Fond!'))))),

    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: Desktop(), tablet: Tablet(), mobile: Mobile());
  }
}


class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  AbRoundedContainer(
                    height: 450,
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    child: const Center(child: Text('Desktop Box 1')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbRoundedContainer(
          height: 350,
          backgroundColor: Colors.green.withOpacity(0.2),
          child: const Center(child: Text('Tablet Box 1')),
        ),
        const SizedBox(height: 16),
        AbRoundedContainer(
          height: 200,
          backgroundColor: Colors.green.withOpacity(0.1),
          child: const Center(child: Text('Tablet Box 2')),
        ),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AbRoundedContainer(
          height: 200,
          backgroundColor: Colors.red.withOpacity(0.2),
          child: const Center(child: Text('Mobile Box 1')),
        ),
        const SizedBox(height: 16),
        AbRoundedContainer(
          height: 150,
          backgroundColor: Colors.red.withOpacity(0.1),
          child: const Center(child: Text('Mobile Box 2')),
        ),
      ],
    );
  }
}
