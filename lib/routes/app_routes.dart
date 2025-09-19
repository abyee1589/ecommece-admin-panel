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
    // GetPage(name: AbRoutes.productReviews, page: () => const ProductReviewsScreen()),
    // GetPage(name: AbRoutes.order, page: () => const Orderscreen()),
    // GetPage(name: AbRoutes.checkout, page: () => const CheckoutScreen()),
    // GetPage(name: AbRoutes.cart, page: () => const CartScreen()),
    // GetPage(name: AbRoutes.userProfile, page: () => const ProfileScreen()),
    // GetPage(name: AbRoutes.userAddress, page: () => const UserAddressScreen()),
    // GetPage(name: AbRoutes.signup, page: () => const SignupScreen()),
    // GetPage(name: AbRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    // GetPage(name: AbRoutes.signin, page: () => const LoginScreen()),
    // GetPage(name: AbRoutes.forgetPassword, page: () => const ForgetPassword()),
    // GetPage(name: AbRoutes.onBoarding, page: () => OnBoardingScreen()),
  ];
}
