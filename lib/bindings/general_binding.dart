import 'package:get/get.dart';

import '../features/authentication/controllers/user_controller.dart';
import '../features/authentication/screens/dashboard/responsive_screens/desktop_dashaboard.dart';
import '../utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => DashboardController());
  }
}
