
import 'package:flutter/material.dart';
import 'package:ab_ecommerce_admin_panel/layouts/headers/sidebars/sidebar_controller.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

class RouteObserver extends GetObserver {

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute){
    final sidebarController = SidebarController.instance;
    if(previousRoute != null){
      for(var routeName in AbRoutes.sidebarMenuItems){
        if(previousRoute.settings.name == routeName){
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
}