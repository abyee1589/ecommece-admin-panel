import 'package:ab_ecommerce_admin_panel/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import '../responsive_design/desktop_media.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbSiteTemplate(desktop: MediaDesktopScreen(),);
  }
}