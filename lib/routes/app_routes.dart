import 'package:ab_ecommerce_admin_panel/features/media/screens/media/media.dart';

import '../common/middlewares/routes_middleware.dart';
import '../features/authentication/screens/forget_password/forget_password_screen.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/reset_password/reset_password.dart';
import '../routes/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../features/authentication/screens/dashboard/dashboard.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: AbRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AbRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: AbRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: AbRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.media, page: () => const MediaScreen(), middlewares: [AbRouteMiddleware()]),
  ];
}
