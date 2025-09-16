import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  /// Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Getx local storage
   
  /// Remove # sign from url
   
  /// Initialize Firebase and Authentication Repositories
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((FirebaseApp value) => Get.put(AuthenticationRepository()))
   
  /// Main starts here
  runApp(const App());
}
