
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController{
  final RxString activeItem = AbRoutes.home.obs;
  final RxString hoverItem = ''.obs;

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoverItem(String route) {
    if(!isActive(route)) hoverItem.value = route;
  }

  bool isActive(String route) => activeItem.value == route;

  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if(!isActive(route)) {
      changeActiveItem(route);

      if(AbDeviceUtils.isMobileScreen(Get.context!)) Get.back();
      Get.toNamed(route);
    }
  }
}