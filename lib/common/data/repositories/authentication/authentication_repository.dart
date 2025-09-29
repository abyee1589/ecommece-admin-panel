import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../routes/routes.dart';
import '../../../exceptions/user_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();
  
  /// Firebase Auth
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  
  /// Authenticated User
  User? get authUser => _auth.currentUser;

  /// Is Authenticated
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady(){
    _auth.setPersistence(Persistence.LOCAL);
    super.onReady();
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if(user == null) {
      Get.offAllNamed(AbRoutes.login);
    }
    else{
      Get.offAllNamed(AbRoutes.dashboard);
    }
  }

  /// Login 
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw AbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code).message;
    } catch (e) {
      throw 'Nothing went wrong, Please try again!';
    }
  }

  /// Register 
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw AbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code).message;
    } catch (e) {
      throw 'Nothing went wrong, Please try again!';
    }
  }

  /// Logout 
  Future<void> logout() async{
    try {
      await _auth.signOut();
      Get.offAllNamed(AbRoutes.login);
    } on FirebaseAuthException catch (e){
      throw AbFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AbFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw AbFormatException();
    } on PlatformException catch (e) {
      throw AbPlatformException(e.code).message;
    } catch (e) {
      throw 'Nothing went wrong, Please try again!';
    }
  }
}

