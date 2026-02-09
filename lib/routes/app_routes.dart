import 'package:ab_ecommerce_admin_panel/features/media/screens/media/media.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/banner/create_banner/create_banner.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/edit_banner.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/brand/create_brand/create_brand.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/customer/all_customers/customers.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/products/all_products/products.dart';

import '../common/middlewares/routes_middleware.dart';
import '../features/authentication/screens/forget_password/forget_password_screen.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/reset_password/reset_password.dart';
import '../features/shop/screens/banner/all_banners/banners.dart';
import '../features/shop/screens/brand/all_brands/brands.dart';
import '../features/shop/screens/brand/edit_brand/edit_brand.dart';
import '../features/shop/screens/category/all_categories/categories.dart';
import '../features/shop/screens/category/create_category/create_category.dart';
import '../features/shop/screens/category/edit_category/edit_category.dart';
import '../features/shop/screens/products/create_product/create_product.dart';
import '../features/shop/screens/products/edit_product/edit_product.dart';
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
    GetPage(name: AbRoutes.categories, page: () => const CategoriesScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.createCategory, page: () => const CreateCategoryScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.editCategory, page: () => const EditCategoryScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.brands, page: () => const BrandsScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.createBrand, page: () => const CreateBrandScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.editBrand, page: () => const EditBrandScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.banners, page: () => const BannersScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.createBanner, page: () => const CreateBannerScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.editBanner, page: () => const EditBannerScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.products, page: () => const ProductsScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.createProduct, page: () => const CreateProductScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [AbRouteMiddleware()]),
    GetPage(name: AbRoutes.customers, page: () => const CustomersScreen(), middlewares: [AbRouteMiddleware()]),
    // GetPage(name: AbRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [AbRouteMiddleware()]),
  ];
}
