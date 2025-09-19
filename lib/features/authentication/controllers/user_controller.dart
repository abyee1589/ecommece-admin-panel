

import '../../../common/data/repositories/user/user_repository.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/loaders/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static  UserController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final userRepository = Get.put(UserRepository());

  Future<UserModel> fetUserDetails() async{
    try {
      final user = await userRepository.fetchUserDetails();
      return user;
    }catch(e) {
      throw AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}