
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController{
  static SidebarController get instance => Get.find();

  ///Variables
  final RxString activeItem = AbRoutes.login.obs;
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