import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';
import '../common/data/repositories/authentication/authentication_repository.dart';


Future<void> main() async {
  /// Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Getx local storage
  GetStorage.init();
   
  /// Remove # sign from url
   
  /// Initialize Firebase and Authentication Repositories
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
   
  /// Main starts here
   setPathUrlStrategy(); 
  runApp(const App());
}
