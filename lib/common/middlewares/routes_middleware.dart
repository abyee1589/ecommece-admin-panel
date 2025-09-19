import '../data/repositories/authentication/authentication_repository.dart';
import '../../routes/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AbRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated ? null : const RouteSettings(name: AbRoutes.login);
  }
}