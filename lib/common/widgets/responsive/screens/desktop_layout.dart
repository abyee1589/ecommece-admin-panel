import 'package:ab_ecommerce_admin_panel/layouts/headers/header.dart';
import 'package:ab_ecommerce_admin_panel/layouts/headers/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        children: [
          const Expanded(child: AbSideBar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                /// Header
                const AbHeader(),
                /// Body
                body ?? const SizedBox(),
              ],
            ),
          ),
        ]
      ),
    );
  }
}