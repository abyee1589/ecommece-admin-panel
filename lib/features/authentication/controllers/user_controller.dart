

import '../../../common/data/repositories/user/user_repository.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/loaders/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static  UserController get instance => Get.find();
  
  /// Variables
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit(){
    fetchUserDetails();
    super.onInit();
  }
  Future<UserModel> fetchUserDetails() async{
    try {
      isLoading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      isLoading.value = false;
      return user;
    }catch(e) {
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return UserModel.empty();
    }
  }
}