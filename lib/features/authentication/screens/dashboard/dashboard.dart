import 'package:ab_ecommerce_admin_panel/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';
import '../dashboard/responsive_screens/desktop_dashaboard.dart';
import '../dashboard/responsive_screens/tablet_dashboard.dart';
import '../dashboard/responsive_screens/mobile_dashoard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: DesktopDashboardScreen(), tablet: TabletDashboardScreen(), mobile: MobileDashboardScreen(),);
  }
}