
import 'package:ab_ecommerce_admin_panel/common/data/repositories/authentication/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../features/authentication/models/user_model.dart';
import '../../../exceptions/user_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final currentUser = AuthenticationRepository.instance.authUser;

  /// Create User
  Future<void> createUser(UserModel user) async{
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e){
      throw AbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong while creating user, Please try again!';
    }
  }
  /// Fetch User Details
  Future<UserModel> fetchAdminDetails() async{
    try {
      final snapshot = await _db.collection('Users').doc(currentUser?.uid).get();
      return UserModel.fromSnapshot((snapshot));
    } on FirebaseAuthException catch (e){
      throw AbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching admin details, please try again!';
    }
  }
}