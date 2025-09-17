import 'package:ab_ecommerce_admin_panel/layouts/headers/header.dart';
import 'package:ab_ecommerce_admin_panel/layouts/headers/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      drawer: const AbSideBar(),
      appBar: AbHeader(scaffoldKey: scaffoldKey,),
      body: body ?? const SizedBox(),
    );
  }
}