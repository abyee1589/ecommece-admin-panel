

import 'package:ab_ecommerce_admin_panel/common/data/repositories/authentication/authentication_repository.dart';
import 'package:ab_ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables 
  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = false.obs;
  final localStorage = GetStorage();
  final userController = UserController.instance;


  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// Create Admin
  Future<void> createAdmin() async{
    try {
      /// Open Loading
      AbFullScreenLoader.openLoadingDialog('Registering Admin Account...', AbImages.lottieAnimation);

      /// Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AbLoaders.warningSnackBar(title: 'No Internet Connection!');
        AbFullScreenLoader.stopLoading();
        return;
      }

      /// Validate the form 
      if(!loginFormKey.currentState!.validate()){
        AbFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    } catch (e) {
      throw 'Nothing went wrong, Please try again!';
    }
  }

  /// Login User
  Future<void> loginAdmin() async{
    try {
      /// Open Loading
      AbFullScreenLoader.openLoadingDialog('Loggoing you in...', AbImages.lottieAnimation);

      /// Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AbLoaders.warningSnackBar(title: 'No Internet Connection!');
        AbFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      print('Logged in successfully!');
    } catch (e) {
      throw 'Nothing went wrong, Please try again!';
    }
  }

  /// Login User
  Future<void> emailAndPasswordSignIN() async{
    try {
      /// Open Loading
      AbFullScreenLoader.openLoadingDialog('Loggoing you in...', AbImages.lottieAnimation);

      /// Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AbLoaders.warningSnackBar(title: 'No Internet Connection!');
        AbFullScreenLoader.stopLoading();
        return;
      }

      /// Validate form 
      if(!loginFormKey.currentState!.validate()){
        AbFullScreenLoader.stopLoading();
        return;
      }

      /// Save Data if Remember Me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user using eamil and password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Fetch user deatails
      final user = await userController.fetchUserDetails();

      AbFullScreenLoader.stopLoading();

      /// Check if the user is not admin to logout and return
      // if (user == null) {
      //   AbLoaders.errorSnackBar(
      //     title: 'Error',
      //     message: 'Failed to fetch user details!',
      //   );
      //   AbFullScreenLoader.stopLoading();
      //   return;
      // }
      if(user.role == AppRole.admin){
        print(user.role);
      await AuthenticationRepository.instance.logout();
      AbLoaders.errorSnackBar(title: 'Not Authorized!', message: 'You are not authorized to acces this data!');
      }
      else {
        print('Logged in successfully!');
        AuthenticationRepository.instance.screenRedirect();
      }
      
    } catch (e) {
      AbFullScreenLoader.stopLoading();
      throw 'Error: ${e.toString()}';
    }
  }
}